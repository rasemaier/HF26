# 03 – Git konfigurieren

**Ziel:** Git weiss, wer du bist, und kann sich bei GitHub anmelden.

**Dauer:** ca. 10 Minuten

**Voraussetzung:** [01 – Git installieren](01_git-installieren.md) und [02 – GitHub-Account](02_github-account.md) sind erledigt.

Diese Einstellungen machst du **nur einmal pro Laptop**. Sie gelten danach für alle Repositories.

---

## Schritt 1: Deinen Namen eintragen

Jeder Commit (jede gespeicherte Version) enthält einen Namen. Öffne PowerShell und gib ein –
ersetze `Vorname Nachname` durch deinen echten Namen, die Anführungszeichen bleiben:

```powershell
git config --global user.name "Vorname Nachname"
```

Beispiel: `git config --global user.name "Anna Muster"`

## Schritt 2: Deine E-Mail eintragen (mit der noreply-Adresse von GitHub)

Jeder Commit enthält auch eine E-Mail-Adresse. Diese ist später für alle sichtbar, die dein Repository sehen.
Damit deine echte Adresse privat bleibt, stellt dir GitHub eine **noreply-Adresse** zur Verfügung.

So findest du sie:

1. Auf GitHub oben rechts auf dein **Profilbild** → **Settings**.
2. Links im Menü: **Emails**.
3. Setze das Häkchen bei **Keep my email addresses private**.
4. Darunter steht jetzt ein Satz mit deiner noreply-Adresse. Sie sieht so aus:

   ```text
   12345678+anna-muster@users.noreply.github.com
   ```

   Die Zahl vorne ist deine persönliche GitHub-ID.
5. Kopiere diese Adresse und trage sie ein:

   ```powershell
   git config --global user.email "12345678+anna-muster@users.noreply.github.com"
   ```

   (Natürlich mit **deiner** Adresse, nicht mit dem Beispiel.)

> Du kannst auch deine echte E-Mail-Adresse verwenden. Sie muss dann aber bei GitHub unter **Emails**
> eingetragen sein, sonst werden deine Commits nicht deinem Account zugeordnet.

## Schritt 3: Standard-Branch `main`

Ein **Branch** ist ein Entwicklungszweig. Der Hauptzweig heisst heute überall `main`:

```powershell
git config --global init.defaultBranch main
```

## Schritt 4: Zeilenenden (nur Windows)

Windows und macOS/Linux speichern Zeilenumbrüche unterschiedlich. Mit dieser Einstellung kümmert sich Git
automatisch darum:

```powershell
git config --global core.autocrlf true
```

Auf **macOS** stattdessen:

```bash
git config --global core.autocrlf input
```

## Schritt 5: Git Credential Manager (Login bei GitHub)

Damit du Code zu GitHub hochladen ("pushen") darfst, muss sich Git bei GitHub anmelden. Das erledigt der
**Git Credential Manager**. Er ist bei Git für Windows schon dabei, wenn du bei der Installation
"Git Credential Manager" gewählt hast (Standard).

Prüfe, ob er eingestellt ist (diesmal **ohne** `--global`, weil Git für Windows diese Einstellung
systemweit speichert):

```powershell
git config credential.helper
```

Erwartete Ausgabe: `manager`

Ist die Ausgabe leer (z. B. auf dem Mac oder bei einer anderen Git-Installation), stelle ihn ein:

```powershell
git config --global credential.helper manager
```

### So läuft der erste Login ab (beim ersten Push)

Den ersten Push machst du in [Anleitung 04](04_kurs-repo-erstellen.md). Dann passiert Folgendes:

1. Nach `git push` (oder `git clone` eines privaten Repositories) öffnet sich ein Fenster
   **"Connect to GitHub"**.
2. Klicke auf **Sign in with your browser**.
3. Dein Browser öffnet eine GitHub-Seite. Falls nötig, logge dich ein (Passwort + 2FA-Code).
4. GitHub fragt: **Authorize git-ecosystem?** → Klicke auf **Authorize git-ecosystem**.
5. Im Browser steht "Authentication Succeeded". Du kannst den Tab schliessen.
6. Zurück im Terminal läuft der Push weiter.

Das musst du **nur einmal** machen. Danach merkt sich Windows den Login sicher im Windows-Anmeldeinformationsspeicher.

---

## Kontrolle

```powershell
git config --global --list
```

In der Ausgabe müssen (unter anderem) diese Zeilen stehen – mit deinen Daten:

```text
user.name=Anna Muster
user.email=12345678+anna-muster@users.noreply.github.com
init.defaultbranch=main
core.autocrlf=true
```

Die Reihenfolge ist egal. Weitere Zeilen sind kein Problem.

Und der Credential Manager:

```powershell
git config credential.helper
```

Ausgabe: `manager`

✅ Stimmen die Zeilen? Weiter mit [04 – Kurs-Repository erstellen](04_kurs-repo-erstellen.md).

## Wenn es nicht klappt

**Ich habe mich beim Namen oder bei der E-Mail vertippt**

- Gib den Befehl einfach nochmals richtig ein. Der neue Wert überschreibt den alten.

**Die Liste ist sehr lang und ich komme nicht mehr zurück zur Eingabe**

- Drücke `q`.

**Beim Push erscheint `GH007: Your push would publish a private email address`**

- Du hast bei GitHub "Block command line pushes that expose my email" eingeschaltet, aber in Git deine echte
  Adresse eingetragen. Trage die **noreply-Adresse** ein (Schritt 2). Dann den letzten Commit korrigieren:

  ```powershell
  git commit --amend --reset-author --no-edit
  git push
  ```

**Beim Push erscheint kein Login-Fenster, sondern eine Frage nach Username und Password im Terminal**

- Der Credential Manager ist nicht eingestellt. Schritt 5 nochmals machen (`credential.helper manager`).
- **Nie** dein GitHub-Passwort im Terminal eingeben – das funktioniert bei GitHub nicht mehr.

**Ich habe mich mit dem falschen GitHub-Account angemeldet**

1. Windows-Taste → **Anmeldeinformationsverwaltung** öffnen.
2. **Windows-Anmeldeinformationen** → Eintrag `git:https://github.com` aufklappen → **Entfernen**.
3. Beim nächsten Push erscheint das Login-Fenster wieder.

**Auf dem Mac erscheint kein Browser-Login**

- Installiere den Git Credential Manager: `brew install --cask git-credential-manager`
