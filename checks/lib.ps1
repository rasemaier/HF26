# Hilfsfunktionen fuer die Checks. Laeuft unter Windows PowerShell 5.1 und PowerShell 7 (Windows/Linux).

function New-CheckResult {
    param(
        [Parameter(Mandatory)] [string] $Kriterium,
        [Parameter(Mandatory)] [bool]   $Ok,
        [string] $Hinweis = ''
    )
    [pscustomobject]@{ Kriterium = $Kriterium; Ok = $Ok; Hinweis = $Hinweis }
}

# Ruft git auf, ohne dass Meldungen auf stderr (Windows PowerShell 5.1) zum Abbruch fuehren.
function Invoke-Git {
    param([string[]] $GitArgs)
    $ErrorActionPreference = 'Continue'
    $out = & git @GitArgs 2>$null
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = @($out) }
}

# Sucht einen Ordner ohne Ruecksicht auf Gross-/Kleinschreibung (Tag1, tag1, TAG1 ...).
function Find-Folder {
    param([string] $Parent, [string] $Name)
    if (-not (Test-Path -LiteralPath $Parent)) { return $null }
    Get-ChildItem -LiteralPath $Parent -Directory -Force |
        Where-Object { $_.Name -ieq $Name } |
        Select-Object -First 1
}

# Sucht eine Datei ohne Ruecksicht auf Gross-/Kleinschreibung.
function Find-File {
    param([string] $Parent, [string] $Name)
    if (-not (Test-Path -LiteralPath $Parent)) { return $null }
    Get-ChildItem -LiteralPath $Parent -File -Force |
        Where-Object { $_.Name -ieq $Name } |
        Select-Object -First 1
}

# Liefert alle .csproj unterhalb eines Ordners (ohne bin/obj).
function Find-CsProj {
    param([string] $Folder)
    if (-not $Folder -or -not (Test-Path -LiteralPath $Folder)) { return @() }
    @(Get-ChildItem -LiteralPath $Folder -Recurse -File -Filter '*.csproj' -Force |
        Where-Object { $_.FullName -notmatch '[\\/](bin|obj)[\\/]' })
}

# Fuehrt einen Befehl mit Timeout aus und liefert ExitCode + Ausgabe.
function Invoke-WithTimeout {
    param(
        [string]   $FilePath,
        [string[]] $Arguments,
        [string]   $WorkingDirectory,
        [int]      $TimeoutSeconds = 120
    )
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $FilePath
    $psi.Arguments = ($Arguments | ForEach-Object { if ($_ -match '\s') { '"' + $_ + '"' } else { $_ } }) -join ' '
    $psi.WorkingDirectory = $WorkingDirectory
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.RedirectStandardInput = $true
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $psi.EnvironmentVariables['DOTNET_CLI_TELEMETRY_OPTOUT'] = '1'
    $psi.EnvironmentVariables['DOTNET_NOLOGO'] = '1'
    $psi.EnvironmentVariables['DOTNET_CLI_UI_LANGUAGE'] = 'de'

    $p = [System.Diagnostics.Process]::Start($psi)
    $outTask = $p.StandardOutput.ReadToEndAsync()
    $errTask = $p.StandardError.ReadToEndAsync()
    # Programme, die auf Console.ReadLine() warten, bekommen eine leere Eingabe.
    $p.StandardInput.Close()

    if (-not $p.WaitForExit($TimeoutSeconds * 1000)) {
        try { $p.Kill() } catch { }
        return [pscustomobject]@{ ExitCode = -1; Output = $outTask.Result + $errTask.Result; TimedOut = $true }
    }
    $p.WaitForExit()
    [pscustomobject]@{ ExitCode = $p.ExitCode; Output = $outTask.Result + $errTask.Result; TimedOut = $false }
}

# Text eines Tages-Abschnitts im README ("## Tag 1 ..." bis zur naechsten "## "-Ueberschrift).
function Get-ReadmeSection {
    param([string] $ReadmeText, [int] $Tag)
    $lines = $ReadmeText -split "`r?`n"
    $inSection = $false
    $result = New-Object System.Collections.Generic.List[string]
    foreach ($line in $lines) {
        if ($line -match '^\s*##\s+') {
            if ($inSection) { break }
            if ($line -match "^\s*##\s+Tag\s*$Tag\b") { $inSection = $true; continue }
        }
        elseif ($inSection) { $result.Add($line) }
    }
    $result.ToArray()
}

# Zaehlt "echte" Zeilen: keine Ueberschriften, keine Kommentare, mind. 3 Woerter.
function Measure-ContentLines {
    param([string[]] $Lines)
    $text = ($Lines -join "`n") -replace '(?s)<!--.*?-->', ''
    @($text -split "`n" |
        ForEach-Object { ($_ -replace '^\s*([-*+]|\d+\.)\s*', '').Trim() } |
        Where-Object { $_ -and $_ -notmatch '^#' -and (($_ -split '\s+').Count -ge 3) }).Count
}
