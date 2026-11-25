# 04 – Kurs-Repository erstellen

**Ziel:** Du hast dein eigenes Kurs-Repository `HF26-<Vorname>` auf GitHub und auf deinem Laptop.
Darin gibst du während des ganzen Kurses deine Übungen ab.

**Dauer:** ca. 15 Minuten

**Voraussetzung:** Anleitungen [01](01_git-installieren.md), [02](02_github-account.md) und
[03](03_git-konfigurieren.md) sind erledigt.

## Wie sieht das Kurs-Repository aus?

Du erstellst dein Repository aus einer **Vorlage** (Template). Darin ist schon alles vorbereitet:

```text
HF26-Anna/
├── README.md        ← dein Lerntagebuch
├── pruefen.ps1      ← prüft lokal, ob deine Abgabe vollständig ist
├── Tag1/            ← hier kommen die Übungen von Tag 1 hinein
├── Tag2/
├── Tag3/
├── Tag4/
├── Tag5/
└── .github/         ← automatischer Check (nicht verändern!)
```

---

## Schritt 1: Repository aus der Vorlage erstellen

1. Logge dich auf <https://github.com> ein.
2. Öffne die Vorlage: <https://github.com/rasemaier/HF26-Vorlage>
3. Klicke oben rechts auf den grünen Knopf **Use this template** → **Create a new repository**.
4. Fülle das Formular aus:
   - **Owner:** dein Username (ist schon ausgewählt)
   - **Repository name:** `HF26-<Vorname>`, also z. B. `HF26-Anna`
     (ohne Umlaute und ohne Leerzeichen: `HF26-Joel` statt `HF26-Joël`, `HF26-Juerg` statt `HF26-Jürg`)
   - **Description:** leer lassen oder z. B. `Kurs Grundlagen IT`
   - **Private** wählen. So sehen nur du und die Lehrperson deine Lösungen.
   - **Include all branches:** nicht anhaken
5. Klicke auf **Create repository**.
6. Nach ein paar Sekunden siehst du dein neues Repository unter `https://github.com/<dein-username>/HF26-<Vorname>`.

## Schritt 2: Die Lehrperson als Collaborator einladen

Damit die Lehrperson dein privates Repository sehen kann, lädst du sie ein:

1. In deinem Repository oben auf **Settings** klicken (Zahnrad, ganz rechts in der Reihe).
2. Links im Menü: **Collaborators** (eventuell steht dort "Collaborators and teams").
3. GitHub fragt eventuell nach deinem Passwort oder dem 2FA-Code – eingeben.
4. Klicke auf **Add people**.
5. Tippe `rasemaier` ein und wähle den Eintrag **rasemaier** aus der Liste.
6. Klicke auf **Add rasemaier to this repository**.
7. Jetzt steht dort **Pending Invite**. Das ist richtig – die Lehrperson muss die Einladung noch annehmen.

## Schritt 3: Das Repository auf deinen Laptop klonen

**Klonen** heisst: eine Kopie des Repositories von GitHub auf deinen Laptop holen.

1. Auf GitHub in deinem Repository auf den grünen Knopf **Code** klicken.
2. Reiter **HTTPS** wählen und die Adresse mit dem Kopier-Symbol kopieren. Sie sieht so aus:
   `https://github.com/anna-muster/HF26-Anna.git`

Danach geht es je nach Laptop weiter:

### Windows

1. Öffne PowerShell und erstelle einen Ordner für alle deine Git-Projekte (falls es ihn noch nicht gibt):

   ```powershell
   mkdir C:\GitHub
   ```

   (Kommt eine Fehlermeldung "existiert bereits", ist das kein Problem.)
2. Wechsle in diesen Ordner:

   ```powershell
   cd C:\GitHub
   ```

3. Klone dein Repository (Adresse mit Rechtsklick einfügen):

   ```powershell
   git clone https://github.com/anna-muster/HF26-Anna.git
   ```

4. Weil dein Repository privat ist, erscheint beim ersten Mal das Fenster **Connect to GitHub**.
   Melde dich wie in [Anleitung 03, Schritt 5](03_git-konfigurieren.md#schritt-5-git-credential-manager-login-bei-github)
   beschrieben über den Browser an.
5. Wechsle in den neuen Ordner:

   ```powershell
   cd HF26-Anna
   ```

### macOS

Auf dem Mac gibt es kein `C:\`. Dein Kurs-Ordner liegt in deinem Benutzerordner (`~` = z. B. `/Users/anna`).
Das Fenster **Connect to GitHub** gibt es auf dem Mac nicht – deshalb klonst du im **Terminal von VS Code**,
dann übernimmt VS Code die Anmeldung.

1. VS Code öffnen → Menü **Terminal** → **New Terminal**.
2. Erstelle einen Ordner für alle deine Git-Projekte und wechsle hinein:

   ```bash
   mkdir -p ~/GitHub
   cd ~/GitHub
   ```

3. Klone dein Repository (Adresse mit **Cmd + V** einfügen):

   ```bash
   git clone https://github.com/anna-muster/HF26-Anna.git
   ```

4. Beim ersten Mal erscheint unten rechts *The extension 'GitHub' wants to sign in using GitHub* → **Allow**.
   Melde dich wie in [Anleitung 03, Schritt 5](03_git-konfigurieren.md#schritt-5-git-credential-manager-login-bei-github)
   (Abschnitt macOS) beschrieben über den Browser an.
5. Wechsle in den neuen Ordner:

   ```bash
   cd HF26-Anna
   ```

**Fragt das Terminal nach `Username for 'https://github.com'`?** Dein GitHub-Passwort funktioniert dort nicht.
Mit **Ctrl + C** abbrechen und die Befehle im **Terminal von VS Code** eingeben.

## Schritt 4: Den Ordner in VS Code öffnen

(VS Code installierst du in [Anleitung 05](05_dotnet-visual-studio.md). Hast du es noch nicht, mach zuerst das.)

**Variante A – im Terminal:** Du bist im Ordner `C:\GitHub\HF26-Anna` (Mac: `~/GitHub/HF26-Anna`). Gib ein:

```powershell
code .
```

(Der Punkt bedeutet "dieser Ordner".)

Mac: Meldet das Terminal `command not found: code`, richte den Befehl zuerst ein
([Anleitung 05, Schritt 3](05_dotnet-visual-studio.md#schritt-3-visual-studio-code-installieren), Abschnitt macOS)
oder nimm Variante B.

**Variante B – über das Menü:** VS Code öffnen → **File** → **Open Folder…** → deinen Ordner auswählen →
**Ordner auswählen** bzw. **Öffnen**.

- Windows: `C:\GitHub\HF26-Anna`
- macOS: im Benutzerordner `GitHub` → `HF26-Anna`

VS Code fragt: **Do you trust the authors of the files in this folder?** → **Yes, I trust the authors**.

Links im **Explorer** siehst du jetzt `README.md`, `Tag1`, `Tag2` usw.

## Schritt 5: Erster eigener Commit und Push

1. Öffne in VS Code die Datei `README.md`.
2. Ersetze `[Dein Name]` durch deinen Namen (auch die eckigen Klammern entfernen).
3. Speichern mit **Ctrl + S** (Mac: **Cmd + S**).
4. Öffne in VS Code das Terminal: Menü **Terminal** → **New Terminal**. Es öffnet sich direkt im richtigen Ordner.
5. Gib nacheinander ein:

   ```powershell
   git add README.md
   git commit -m "Name im Lerntagebuch eingetragen"
   git push
   ```

6. Lade dein Repository auf GitHub neu. Im README steht jetzt dein Name.

Mehr zum Abgeben und zum automatischen Check: [Anleitung 08](08_abgabe-und-check.md).

---

## Kontrolle

Im Terminal, im Ordner deines Repositories:

```powershell
git remote -v
git log --oneline
```

Erwartete Ausgabe (mit deinen Namen):

```text
origin  https://github.com/anna-muster/HF26-Anna.git (fetch)
origin  https://github.com/anna-muster/HF26-Anna.git (push)
a1b2c3d (HEAD -> main, origin/main) Name im Lerntagebuch eingetragen
9f8e7d6 Initial commit
```

✅ Siehst du deinen Commit? Und steht in GitHub unter **Settings → Collaborators** `rasemaier`?
Dann bist du fertig.

## Wenn es nicht klappt

**Ich sehe den Knopf "Use this template" nicht**

- Du bist nicht eingeloggt. Logge dich auf GitHub ein und lade die Seite neu.

**`fatal: repository '…' not found` beim Klonen**

- Tippfehler in der Adresse? Kopiere sie nochmals mit dem Knopf **Code**.
- Du bist im Credential Manager mit einem anderen GitHub-Account angemeldet. Siehe
  [Anleitung 03 – Wenn es nicht klappt](03_git-konfigurieren.md#wenn-es-nicht-klappt).

**`fatal: destination path 'HF26-Anna' already exists`**

- Du hast schon einmal geklont. Wechsle einfach mit `cd HF26-Anna` in den Ordner.

**`code : Die Benennung "code" wurde nicht … erkannt`** (Mac: `command not found: code`)

- VS Code ist nicht installiert oder das Terminal wurde seit der Installation nicht neu geöffnet.
  Nimm Variante B (Menü **File → Open Folder…**).
- Mac: Den Befehl `code` musst du einmal selbst einrichten – siehe
  [Anleitung 05, Schritt 3](05_dotnet-visual-studio.md#schritt-3-visual-studio-code-installieren), Abschnitt macOS.

**Mac: Das Terminal fragt nach `Username for 'https://github.com'`**

- Mit **Ctrl + C** abbrechen und den Befehl im **Terminal von VS Code** wiederholen
  ([Anleitung 03, Schritt 5](03_git-konfigurieren.md#schritt-5-git-credential-manager-login-bei-github), Abschnitt macOS).

**Ich finde `rasemaier` nicht bei "Add people"**

- Tippe den Namen genau so: `rasemaier` (ohne Leerzeichen). Warte kurz, bis die Liste erscheint.

**Ich habe mein Repository falsch benannt**

- **Settings** → ganz oben **Repository name** ändern → **Rename**. Danach im Terminal:

  ```powershell
  git remote set-url origin https://github.com/<dein-username>/HF26-<Vorname>.git
  ```

**`git push` meldet `rejected … fetch first`**

- Auf GitHub gibt es Änderungen, die du noch nicht hast (z. B. weil du direkt auf der Webseite etwas geändert hast).
  Hole sie zuerst:

  ```powershell
  git pull
  git push
  ```
