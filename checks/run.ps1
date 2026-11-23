# Fuehrt die Checks aller freigegebenen Tage (oder eines bestimmten Tages) aus.
#   GitHub Actions:  pwsh _hf26/checks/run.ps1 -RepoPath . -Tag tag1
#   Lokal:           wird von pruefen.ps1 im Schueler-Repo aufgerufen (-Lokal)
# Exit-Code 0 = alles erfuellt, 1 = es fehlt noch etwas.
param(
    [string] $RepoPath = (Get-Location).Path,
    [string] $Tag,
    [string] $ChecksRoot = $PSScriptRoot,
    [switch] $Lokal
)

$ErrorActionPreference = 'Stop'
. (Join-Path $ChecksRoot 'lib.ps1')

$RepoPath = (Resolve-Path -LiteralPath $RepoPath).Path.TrimEnd('\', '/')
$isCi = $env:GITHUB_ACTIONS -eq 'true'

if ($Tag) {
    $tage = @($Tag.ToLower())
}
else {
    $json = Get-Content -LiteralPath (Join-Path $ChecksRoot 'released.json') -Raw | ConvertFrom-Json
    # ForEach-Object entpackt das Array (Windows PowerShell 5.1 liefert es sonst verschachtelt)
    $tage = @($json | ForEach-Object { $_ } | ForEach-Object { "$_".ToLower() })
}

function Format-TagName([string] $t) { ($t -replace '(?i)^tag(\d+)$', 'Tag $1') }

$alleOk = $true
$summary = New-Object System.Collections.Generic.List[string]

foreach ($t in $tage) {
    $script = Join-Path $ChecksRoot "$t.ps1"
    if (-not (Test-Path -LiteralPath $script)) { continue }

    $name = Format-TagName $t
    Write-Host ''
    Write-Host "=== $name ===" -ForegroundColor Cyan

    $results = @(& $script -RepoPath $RepoPath)
    $offen = @($results | Where-Object { -not $_.Ok })

    foreach ($r in $results) {
        if ($r.Ok) {
            Write-Host '  [OK]    ' -ForegroundColor Green -NoNewline
            Write-Host $r.Kriterium
        }
        else {
            Write-Host '  [FEHLT] ' -ForegroundColor Red -NoNewline
            Write-Host $r.Kriterium
            if ($r.Hinweis) { Write-Host "          -> $($r.Hinweis)" -ForegroundColor Yellow }
            if ($isCi) {
                $msg = ($r.Hinweis -replace '[\r\n]+', ' ') -replace '%', '%25'
                Write-Host "::error title=$name - $($r.Kriterium)::$msg"
            }
        }
    }

    if ($offen.Count -eq 0) {
        Write-Host "  => $name erledigt!" -ForegroundColor Green
    }
    else {
        $alleOk = $false
        Write-Host "  => $name`: noch $($offen.Count) Punkt(e) offen." -ForegroundColor Red
    }

    # Markdown fuer die Zusammenfassung in GitHub Actions
    if ($offen.Count -eq 0) { $summary.Add("## :tada: $name erledigt - du darfst gehen!") }
    else { $summary.Add("## :x: $name - noch $($offen.Count) Punkt(e) offen") }
    $summary.Add('')
    $summary.Add('| | Kriterium | Was tun? |')
    $summary.Add('|---|---|---|')
    foreach ($r in $results) {
        $icon = if ($r.Ok) { ':white_check_mark:' } else { ':x:' }
        $hinweis = if ($r.Ok) { '' } else { ($r.Hinweis -replace '\|', '/') -replace '[\r\n]+', ' ' }
        $summary.Add("| $icon | $($r.Kriterium) | $hinweis |")
    }
    $summary.Add('')
}

# Zusaetzliche Kontrollen nur lokal: ist alles committet und gepusht?
if ($Lokal) {
    Write-Host ''
    Write-Host '=== Git ===' -ForegroundColor Cyan
    $dirty = (Invoke-Git @('-C', $RepoPath, 'status', '--porcelain')).Output | Where-Object { $_ }
    $dirty = @($dirty)
    if ($dirty.Count -gt 0) {
        $alleOk = $false
        Write-Host '  [FEHLT] ' -ForegroundColor Red -NoNewline
        Write-Host "Alles committet ($($dirty.Count) Datei(en) noch nicht committet)"
        Write-Host '          -> git add .  und  git commit -m "..."' -ForegroundColor Yellow
    }
    else {
        Write-Host '  [OK]    ' -ForegroundColor Green -NoNewline
        Write-Host 'Alles committet'
    }
    $r = Invoke-Git @('-C', $RepoPath, 'rev-list', '--count', '@{u}..HEAD')
    $ahead = ($r.Output | Select-Object -First 1)
    if ($r.ExitCode -ne 0) {
        $alleOk = $false
        Write-Host '  [FEHLT] ' -ForegroundColor Red -NoNewline
        Write-Host 'Mit GitHub verbunden (kein Upstream-Branch gefunden)'
        Write-Host '          -> git push -u origin main' -ForegroundColor Yellow
    }
    elseif ([int]$ahead -gt 0) {
        $alleOk = $false
        Write-Host '  [FEHLT] ' -ForegroundColor Red -NoNewline
        Write-Host "Alles gepusht ($ahead Commit(s) noch nicht auf GitHub)"
        Write-Host '          -> git push' -ForegroundColor Yellow
    }
    else {
        Write-Host '  [OK]    ' -ForegroundColor Green -NoNewline
        Write-Host 'Alles gepusht'
    }
}

if ($isCi -and $env:GITHUB_STEP_SUMMARY) {
    Add-Content -LiteralPath $env:GITHUB_STEP_SUMMARY -Value ($summary -join "`n") -Encoding UTF8
}

Write-Host ''
if ($alleOk) {
    Write-Host '*** Alles erledigt. Du darfst gehen! ***' -ForegroundColor Green
    if ($Lokal) { Write-Host '(Kontrolliere zur Sicherheit den gruenen Haken auf GitHub.)' }
    exit 0
}
else {
    Write-Host '*** Noch nicht fertig - siehe [FEHLT] oben. ***' -ForegroundColor Red
    exit 1
}
