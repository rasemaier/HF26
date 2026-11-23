# Checks fuer Tag 1 (28.11.2026)
# Liefert eine Liste von Ergebnissen (New-CheckResult). Wird von run.ps1 aufgerufen.
param(
    [Parameter(Mandatory)] [string] $RepoPath
)

$results = New-Object System.Collections.Generic.List[object]

# --- 1. README / Lerntagebuch ---------------------------------------------
$readme = Find-File -Parent $RepoPath -Name 'README.md'
if (-not $readme) {
    $results.Add((New-CheckResult 'README.md vorhanden' $false 'Im Hauptordner deines Repos fehlt die Datei README.md.'))
}
else {
    $text = [string](Get-Content -LiteralPath $readme.FullName -Raw -Encoding UTF8)

    # Nur die Titelzeile pruefen ("# HF26 – Lerntagebuch von ..."). Im Erklaertext darunter
    # darf "[Dein Name]" stehen bleiben.
    $titel = ($text -split "`r?`n" | Where-Object { $_ -match '^\s*#\s+\S' } | Select-Object -First 1)
    $nameOk = $titel -and ($titel -notmatch '\[Dein Name\]') -and ($titel -notmatch '(?i)\bvon\s*$')
    $results.Add((New-CheckResult 'README: eigener Name eingetragen' ([bool]$nameOk) `
        'Ersetze in der ersten Zeile von README.md den Platzhalter [Dein Name] durch deinen Namen (z.B. "# HF26 – Lerntagebuch von Anna Muster").'))

    $count = Measure-ContentLines (Get-ReadmeSection -ReadmeText $text -Tag 1)
    $results.Add((New-CheckResult 'README: Lerntagebuch Tag 1 (mind. 3 Saetze)' ($count -ge 3) `
        "Schreibe unter '## Tag 1' mindestens 3 Saetze/Stichpunkte (je mind. 3 Woerter), was du heute gelernt hast. Gefunden: $count."))
}

# --- 2. + 3. Hello-World-Programm -----------------------------------------
$tagFolder = Find-Folder -Parent $RepoPath -Name 'Tag1'
$projects = @()
if ($tagFolder) { $projects = Find-CsProj -Folder $tagFolder.FullName }

if ($projects.Count -eq 0) {
    $results.Add((New-CheckResult 'C#-Projekt in Tag1/HelloWorld' $false `
        'Kein .csproj gefunden. Erstelle mit Visual Studio oder "dotnet new console -o Tag1/HelloWorld" eine Konsolen-App im Ordner Tag1/HelloWorld.'))
    $results.Add((New-CheckResult 'Programm gibt Name und Alter aus' $false 'Zuerst muss das Projekt existieren.'))
}
else {
    # Bevorzugt Tag1/HelloWorld, sonst das erste Projekt im Ordner Tag1
    $proj = $projects | Where-Object { $_.FullName -match '(?i)[\\/]HelloWorld[\\/]' } | Select-Object -First 1
    if (-not $proj) { $proj = $projects[0] }
    $rel = $proj.FullName.Substring($RepoPath.Length).TrimStart('\', '/')

    $build = Invoke-WithTimeout -FilePath 'dotnet' -Arguments @('build', $proj.FullName, '-nologo', '-v', 'q') `
        -WorkingDirectory $proj.DirectoryName -TimeoutSeconds 240
    if ($build.ExitCode -ne 0) {
        $errors = ($build.Output -split "`r?`n" | Where-Object { $_ -match 'error' } | Select-Object -First 3) -join ' | '
        if ($build.TimedOut) { $errors = 'Build hat zu lange gedauert.' }
        $results.Add((New-CheckResult "C#-Projekt kompiliert ($rel)" $false "dotnet build schlaegt fehl: $errors"))
        $results.Add((New-CheckResult 'Programm gibt Name und Alter aus' $false 'Zuerst muss das Projekt fehlerfrei kompilieren.'))
    }
    else {
        $results.Add((New-CheckResult "C#-Projekt kompiliert ($rel)" $true))

        $run = Invoke-WithTimeout -FilePath 'dotnet' -Arguments @('run', '--no-build', '--project', $proj.FullName) `
            -WorkingDirectory $proj.DirectoryName -TimeoutSeconds 60
        $out = [string]$run.Output
        $ok = ($out -match '(?i)hallo') -and ($out -match '(?i)ich bin') -and ($out -match '(?i)\d+\s+Jahre\s+alt')
        $first = (($out -split "`r?`n" | Where-Object { $_.Trim() } | Select-Object -First 3) -join ' | ')
        if ($run.TimedOut) { $first = 'Programm wartet auf Eingabe oder endet nicht.' }
        $results.Add((New-CheckResult 'Programm gibt Name und Alter aus' $ok `
            "Erwartet z.B.: 'Hallo, ich bin Anna und 23 Jahre alt'. Deine Ausgabe: $first"))
    }
}

# --- 4. Docker-Nachweis ----------------------------------------------------
$dockerFile = $null
if ($tagFolder) { $dockerFile = Find-File -Parent $tagFolder.FullName -Name 'docker.txt' }
$dockerOk = $false
if ($dockerFile) {
    # [string] noetig: bei leerer Datei liefert Get-Content ein leeres Array statt eines Strings
    $dockerOk = [string](Get-Content -LiteralPath $dockerFile.FullName -Raw) -match 'Hello from Docker!'
}
$hint = 'Fuehre "docker run hello-world | Out-File -FilePath Tag1\docker.txt -Encoding utf8" aus (Docker Desktop muss laufen, Anleitung 06) und committe die Datei.'
if ($dockerFile -and -not $dockerOk) { $hint = 'Tag1/docker.txt enthaelt nicht "Hello from Docker!". ' + $hint }
$results.Add((New-CheckResult 'Docker laeuft (Tag1/docker.txt)' $dockerOk $hint))

# --- 5. Commits vom eigenen PC ---------------------------------------------
$committers = (Invoke-Git @('-C', $RepoPath, 'log', '--format=%cn')).Output
$localCommits = @($committers | Where-Object { $_ -and $_ -ne 'GitHub' }).Count
$results.Add((New-CheckResult 'Mind. 2 Commits von deinem PC' ($localCommits -ge 2) `
    "Gefunden: $localCommits. Commits ueber die GitHub-Webseite zaehlen nicht. Arbeite lokal und mache git add / git commit / git push (Anleitung 08)."))

$results
