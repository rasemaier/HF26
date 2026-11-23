# 05 – .NET, Visual Studio und VS Code installieren

**Ziel:** Du kannst C#-Programme erstellen und ausführen.

**Dauer:** ca. 30–60 Minuten (grosse Downloads – am besten zu Hause erledigen!)

## Was installieren wir?

| Programm | Wozu? |
| --- | --- |
| **.NET 10 SDK** | Die Werkzeuge, um C#-Programme zu bauen und zu starten (Befehl `dotnet`). |
| **Visual Studio Community** | Eine grosse Entwicklungsumgebung (IDE) für C# und Blazor. Kostenlos für Lernende. Nur Windows. |
| **Visual Studio Code** (VS Code) | Ein schlanker Editor. Wir öffnen damit unsere Repositories und arbeiten im Terminal. |
| **C# Dev Kit** | Erweiterung, damit VS Code C# versteht. |

Du brauchst **Visual Studio und VS Code**. Im Kurs zeigen wir beide; du entscheidest selbst, womit du lieber arbeitest.

---

## Schritt 1: .NET 10 SDK installieren

**Variante A – mit winget (Windows):**

```powershell
winget install --id Microsoft.DotNet.SDK.10 -e
```

**Variante B – Download:**

1. Öffne <https://dotnet.microsoft.com/download/dotnet/10.0>.
2. Unter **SDK 10.0.x** bei **Windows** auf **x64** klicken
   (Laptop mit ARM-Prozessor, z. B. Snapdragon: **Arm64**).
3. Datei öffnen → **Installieren** → bei "Möchten Sie zulassen …" **Ja** → **Schliessen**.

**macOS:** Auf derselben Seite unter **macOS** den Installer wählen (**Arm64** für Apple M1/M2/M3/M4,
**x64** für ältere Intel-Macs). Oder mit Homebrew: `brew install --cask dotnet-sdk`

**Danach PowerShell schliessen und neu öffnen.**

## Schritt 2: Visual Studio Community installieren (nur Windows)

1. Öffne <https://visualstudio.microsoft.com/de/downloads/>.
2. Unter **Community** auf **Kostenloser Download** klicken.
3. Die heruntergeladene Datei `VisualStudioSetup.exe` öffnen → **Ja** → **Weiter**.
   Der Visual Studio Installer wird vorbereitet.
4. Es erscheint das Fenster **Workloads**. Setze ein Häkchen bei:
   - ✅ **ASP.NET und Webentwicklung** (englisch: *ASP.NET and web development*)
5. Sonst nichts anhaken. Rechts unten auf **Installieren** klicken.
6. Warten (je nach Internet 15–45 Minuten).
7. Beim ersten Start fragt Visual Studio nach einer Anmeldung. Du kannst dich mit einem Microsoft-Konto anmelden
   oder auf **Später** / **Diesen Schritt überspringen** klicken.
8. Farbschema nach Geschmack wählen → **Visual Studio starten**.

**macOS:** Visual Studio gibt es für den Mac nicht mehr. Du arbeitest mit VS Code (Schritt 3) – das reicht für den ganzen Kurs.

## Schritt 3: Visual Studio Code installieren

**Variante A – mit winget:**

```powershell
winget install --id Microsoft.VisualStudioCode -e
```

**Variante B – Download:** <https://code.visualstudio.com/> → **Download for Windows** → Datei öffnen.
Im Installer bei **Zusätzliche Aufgaben auswählen** diese Häkchen setzen:

- ✅ "Mit Code öffnen" zum Dateikontextmenü von Windows-Explorer hinzufügen
- ✅ "Mit Code öffnen" zum Verzeichniskontextmenü von Windows-Explorer hinzufügen
- ✅ Zu PATH hinzufügen (ist standardmässig angehakt – **unbedingt** so lassen)

**Danach PowerShell schliessen und neu öffnen.**

## Schritt 4: Erweiterung C# Dev Kit in VS Code installieren

1. VS Code öffnen.
2. Links auf das Symbol **Extensions** klicken (vier Quadrate) oder **Ctrl + Shift + X**.
3. Im Suchfeld `C# Dev Kit` eingeben.
4. Beim Eintrag **C# Dev Kit** von **Microsoft** (mit blauem Häkchen) auf **Install** klicken.
   Die benötigten Erweiterungen **C#** und **.NET Install Tool** werden automatisch mitinstalliert.

Alternativ im Terminal:

```powershell
code --install-extension ms-dotnettools.csdevkit
```

---

## Kontrolle

### 1. .NET-Version prüfen

```powershell
dotnet --version
```

Erwartete Ausgabe: eine Zahl, die mit **10** beginnt, z. B.

```text
10.0.100
```

### 2. Ein Test-Programm erstellen und starten

Wir erstellen ein Test-Programm in einem Übungsordner (nicht in deinem Kurs-Repository):

```powershell
cd $HOME
dotnet new console -o DotnetTest
cd DotnetTest
dotnet run
```

Erwartete Ausgabe:

```text
Hello, World!
```

Beim allerersten Mal erscheint vorher ein längerer Willkommenstext von .NET – das ist normal.

Den Test-Ordner kannst du danach löschen:

```powershell
cd $HOME
Remove-Item -Recurse DotnetTest
```

### 3. Visual Studio und VS Code

- Visual Studio startet und zeigt das Startfenster mit **Neues Projekt erstellen**.
- In VS Code ist unter **Extensions → Installed** der Eintrag **C# Dev Kit** sichtbar.

✅ Alles in Ordnung? Weiter mit [06 – Docker und PostgreSQL](06_docker-postgresql.md).

## Wenn es nicht klappt

**`dotnet : Die Benennung "dotnet" wurde nicht … erkannt`**

- PowerShell nach der Installation schliessen und neu öffnen. Hilft das nicht: Laptop neu starten.

**`dotnet --version` zeigt 8.x oder 9.x statt 10.x**

- Prüfe, welche SDKs installiert sind:

  ```powershell
  dotnet --list-sdks
  ```

  Fehlt 10.x, installiere es (Schritt 1).
- Steht 10.x in der Liste, aber `dotnet --version` zeigt trotzdem eine ältere Version, liegt in einem
  übergeordneten Ordner eine Datei `global.json`. Führe den Befehl in einem anderen Ordner aus (z. B. `cd $HOME`).

**`No templates or subcommands found matching: 'console'`**

- Das SDK ist nicht richtig installiert (vielleicht nur die "Runtime"). Installiere das **SDK** (Schritt 1).

**Visual Studio zeigt keine Vorlage "Blazor Web App" oder "ASP.NET Core"**

- Die Workload fehlt. Starte den **Visual Studio Installer** (Windows-Taste → "Visual Studio Installer") →
  bei Visual Studio auf **Ändern** → ✅ **ASP.NET und Webentwicklung** → **Ändern**.

**VS Code: `code` wird im Terminal nicht erkannt**

- VS Code neu installieren und darauf achten, dass **Zu PATH hinzufügen** angehakt ist. Danach Terminal neu öffnen.

**C# Dev Kit verlangt eine Anmeldung**

- Für Lernende ist das C# Dev Kit kostenlos. Du kannst die Anmeldung überspringen; Programme erstellen und
  starten funktioniert trotzdem.

**Der Laptop hat zu wenig Speicherplatz**

- Visual Studio braucht ca. 10–20 GB. Räume vorher auf oder arbeite nur mit .NET SDK + VS Code (ca. 1 GB).
