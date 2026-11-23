# 01 – Git installieren

**Ziel:** Am Ende kannst du im Terminal `git --version` eingeben und bekommst eine Versionsnummer.

**Dauer:** ca. 10 Minuten

## Was ist Git?

Git ist ein Programm, das sich jede Version deiner Dateien merkt. Du kannst jederzeit zu einer früheren
Version zurück und deine Arbeit auf GitHub hochladen. Im Kurs gibst du alle Übungen mit Git ab.

## Was ist ein Terminal?

Ein Terminal ist ein Fenster, in das du Befehle eintippst. Unter Windows verwenden wir **PowerShell**:

1. Drücke die **Windows-Taste**.
2. Tippe `PowerShell` oder `Terminal`.
3. Klicke auf **Windows PowerShell** bzw. **Terminal**.

Einen Befehl führst du aus, indem du ihn eintippst (oder hineinkopierst) und **Enter** drückst.

---

## Windows – Variante A: mit winget (empfohlen, schnell)

`winget` ist der Paketmanager von Windows. Er ist auf Windows 10 und 11 normalerweise schon installiert.

1. Öffne **PowerShell**.
2. Gib diesen Befehl ein und drücke Enter:

   ```powershell
   winget install --id Git.Git -e
   ```

3. Beim ersten Mal fragt winget eventuell, ob du den Bedingungen zustimmst. Tippe `Y` und drücke Enter.
4. Eventuell erscheint ein Fenster "Möchten Sie zulassen, dass diese App Änderungen an Ihrem Gerät vornimmt?"
   Klicke auf **Ja**.
5. Warte, bis `Erfolgreich installiert` (oder `Successfully installed`) erscheint.
6. **Schliesse PowerShell und öffne es neu.** Erst dann kennt das Terminal den Befehl `git`.

Weiter mit [Kontrolle](#kontrolle).

## Windows – Variante B: mit dem Installer

Wenn winget nicht funktioniert, lädst du den Installer herunter:

1. Öffne <https://git-scm.com/downloads/win>.
2. Klicke auf **Click here to download** (64-bit Git for Windows Setup).
3. Öffne die heruntergeladene Datei `Git-…-64-bit.exe`.
4. Klicke bei "Möchten Sie zulassen, dass …" auf **Ja**.

Der Installer zeigt viele Seiten. Du kannst fast überall **Next** klicken. Hier die empfohlenen Einstellungen
pro Seite (die Reihenfolge kann je nach Version leicht abweichen):

| Seite im Installer | Was du wählst |
| --- | --- |
| **Information** (Lizenz) | **Next** |
| **Select Destination Location** | Standard lassen (`C:\Program Files\Git`) → **Next** |
| **Select Components** | Standard lassen → **Next** |
| **Select Start Menu Folder** | Standard lassen → **Next** |
| **Choosing the default editor used by Git** | **Use Visual Studio Code as Git's default editor** wählen (falls VS Code schon installiert ist), sonst **Use Notepad as Git's default editor**. Bitte **nicht** Vim (der Standard) – Vim ist für Anfänger sehr verwirrend. → **Next** |
| **Adjusting the name of the initial branch in new repositories** | **Override the default branch name for new repositories** wählen, im Feld steht `main` → **Next** |
| **Adjusting your PATH environment** | **Git from the command line and also from 3rd-party software** (Recommended) → **Next** |
| **Choosing the SSH executable** | **Use bundled OpenSSH** → **Next** |
| **Choosing HTTPS transport backend** | **Use the OpenSSL library** → **Next** |
| **Configuring the line ending conversions** | **Checkout Windows-style, commit Unix-style line endings** → **Next** |
| **Configuring the terminal emulator to use with Git Bash** | **Use MinTTY (the default terminal of MSYS2)** → **Next** |
| **Choose the default behavior of `git pull`** | **Fast-forward or merge** (Standard) → **Next** |
| **Choose a credential helper** | **Git Credential Manager** → **Next** (wichtig für den Login bei GitHub!) |
| **Configuring extra options** | **Enable file system caching** angehakt lassen → **Next** |
| **Configuring experimental options** | nichts anhaken → **Install** |
| **Completing the Git Setup** | Häkchen bei "View Release Notes" entfernen → **Finish** |

5. **Schliesse PowerShell und öffne es neu.**

## macOS (kurz)

1. Öffne das Programm **Terminal** (Cmd + Leertaste, `Terminal` tippen, Enter).
2. Gib ein:

   ```bash
   xcode-select --install
   ```

3. Im Fenster auf **Installieren** klicken und warten. Damit wird Git mitinstalliert.
4. Alternative, falls du [Homebrew](https://brew.sh) hast: `brew install git`

---

## Kontrolle

Öffne ein **neues** Terminal und gib ein:

```powershell
git --version
```

Erwartete Ausgabe (die Zahl darf anders sein):

```text
git version 2.52.0.windows.1
```

✅ Siehst du eine Versionsnummer? Dann bist du fertig. Weiter mit [02 – GitHub-Account](02_github-account.md).

## Wenn es nicht klappt

**`git : Die Benennung "git" wurde nicht als Name eines Cmdlet … erkannt`** (oder `'git' is not recognized`)

- Du hast PowerShell nach der Installation nicht neu geöffnet. Alle Terminal-Fenster schliessen und neu öffnen.
- Hilft das nicht: Laptop neu starten.
- Hilft auch das nicht: Installer (Variante B) nochmals ausführen und bei **Adjusting your PATH environment**
  unbedingt die mittlere Option (Recommended) wählen.

**`winget : Die Benennung "winget" wurde nicht … erkannt`**

- winget fehlt oder ist veraltet. Öffne den **Microsoft Store**, suche nach **App-Installer** und klicke auf
  **Aktualisieren** bzw. **Installieren**. Oder nimm einfach Variante B (Installer).

**`Es wurde kein Paket gefunden, das den Eingabekriterien entspricht`**

- Prüfe, ob du den Befehl genau so abgetippt hast: `winget install --id Git.Git -e`
- Führe `winget source update` aus und versuche es nochmals.

**Ich habe keine Administratorrechte (Firmen-Laptop)**

- Im Installer (Variante B) erscheint dann eventuell die Frage, ob nur für dich installiert werden soll.
  Wähle **Only for me** bzw. **Nur für mich**.
- Klappt das nicht, sprich mit deiner IT-Abteilung oder der Lehrperson.

**Ich habe aus Versehen Vim als Editor gewählt und hänge in einem komischen Fenster fest**

- Drücke `Esc`, tippe `:q!` und drücke Enter. Damit verlässt du Vim.
- Den Editor kannst du später ändern: `git config --global core.editor "code --wait"`
