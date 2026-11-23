# 08 – Abgabe und automatischer Check

**Ziel:** Du kannst deine Arbeit auf GitHub abgeben und siehst, ob sie vollständig ist.

**Voraussetzung:** Dein Kurs-Repository ist erstellt und geklont ([Anleitung 04](04_kurs-repo-erstellen.md)).

## So funktioniert die Abgabe

```text
Dein Laptop                         GitHub
───────────                         ──────
Dateien ändern
     │
git add      (Änderungen auswählen)
     │
git commit   (Version speichern)
     │
git push   ───────────────────────► Dein Repository
                                         │
                                    automatischer Check
                                         │
                                    ✅ grün = fertig
                                    ❌ rot  = es fehlt noch etwas
```

---

## Schritt 1: Änderungen ansehen – `git status`

Öffne das Terminal in deinem Kurs-Repository (VS Code: **Terminal → New Terminal**) und gib ein:

```powershell
git status
```

Git zeigt dir:

- **rot** – geänderte oder neue Dateien, die noch nicht für den Commit ausgewählt sind
- **grün** – Dateien, die für den nächsten Commit ausgewählt sind

## Schritt 2: Änderungen auswählen – `git add`

Alle Änderungen auswählen:

```powershell
git add .
```

(Der Punkt bedeutet "alles in diesem Ordner".) Prüfe danach mit `git status` – jetzt ist alles grün.

## Schritt 3: Version speichern – `git commit`

```powershell
git commit -m "Tag 1: HelloWorld erstellt"
```

Die Nachricht nach `-m` beschreibt kurz, **was** du gemacht hast.

✅ Gute Commit-Nachrichten: `"Tag 1: Lerntagebuch ergänzt"`, `"HelloWorld gibt Name und Alter aus"`
❌ Schlechte Commit-Nachrichten: `"update"`, `"asdf"`, `"fertig"`

**Tipp:** Lieber mehrere kleine Commits als ein grosser. Mach einen Commit, sobald ein Teil funktioniert.

## Schritt 4: Hochladen – `git push`

```powershell
git push
```

Jetzt ist deine Arbeit auf GitHub. Beim allerersten Mal erscheint eventuell das Login-Fenster
(siehe [Anleitung 03](03_git-konfigurieren.md#so-läuft-der-erste-login-ab-beim-ersten-push)).

---

## Schritt 5: Den automatischen Check auf GitHub lesen

Nach jedem Push prüft GitHub deine Abgabe automatisch. Das dauert ca. 1 Minute.

1. Öffne dein Repository auf GitHub, z. B. `https://github.com/anna-muster/HF26-Anna`.
2. Klicke oben auf den Reiter **Actions**.
3. Du siehst eine Liste der Prüfläufe. Der oberste ist der neueste – er trägt deine Commit-Nachricht.
   Das Symbol links zeigt den Zustand:

   | Symbol | Bedeutung |
   | --- | --- |
   | 🟡 gelber Kreis (dreht sich) | Der Check läuft noch. Kurz warten und Seite neu laden. |
   | ✅ grüner Haken | **Alles erfüllt – du bist fertig und darfst gehen!** |
   | ❌ rotes Kreuz | Es fehlt noch etwas. |

4. Klicke auf den Lauf (auf die Commit-Nachricht). Es öffnet sich die **Details-Seite** (Summary).
5. Weiter unten steht eine **Tabelle**, die jeden Prüfpunkt einzeln zeigt. In der Spalte **Was tun?**
   steht bei jedem ❌, was du noch erledigen musst. Zum Beispiel:

   | | Kriterium | Was tun? |
   | --- | --- | --- |
   | ✅ | README: eigener Name eingetragen | |
   | ❌ | README: Lerntagebuch Tag 1 (mind. 3 Saetze) | Schreibe unter '## Tag 1' mindestens 3 Saetze/Stichpunkte … |
   | ✅ | C#-Projekt kompiliert (Tag1/HelloWorld/HelloWorld.csproj) | |
   | ✅ | Programm gibt Name und Alter aus | |
   | ❌ | Mind. 2 Commits von deinem PC | Gefunden: 1. … |

   (Die genauen Texte können etwas anders aussehen.)
6. Behebe, was mit ❌ markiert ist, und mach nochmals `git add`, `git commit`, `git push`.
   Der Check läuft automatisch neu.

**Abkürzung:** Auf der Startseite deines Repositories steht neben dem letzten Commit ebenfalls ein kleiner
✅ / ❌ / 🟡. Ein Klick darauf → **Details** führt direkt zum Check.

**Wichtig:** Geprüft werden nur die Tage, die schon stattgefunden haben. Für Tage, die noch kommen, musst du nichts tun.

---

## Schritt 6: Vor dem Push lokal prüfen – `pruefen.ps1`

Du musst nicht jedes Mal auf GitHub warten. In deinem Kurs-Repository liegt das Skript `pruefen.ps1`.
Es prüft dieselben Punkte direkt auf deinem Laptop.

Im Terminal, im Ordner deines Kurs-Repositories:

```powershell
./pruefen.ps1
```

Das Skript lädt die aktuellen Prüfungen von GitHub (Internet nötig) und zeigt dir jeden Prüfpunkt:

```text
=== Tag 1 ===
  [OK]    README: eigener Name eingetragen
  [FEHLT] README: Lerntagebuch Tag 1 (mind. 3 Saetze)
          -> Schreibe unter '## Tag 1' mindestens 3 Saetze/Stichpunkte ...
  ...
  => Tag 1: noch 1 Punkt(e) offen.
```

Bei `[FEHLT]` steht in der Zeile darunter, was du tun musst. Nur einen bestimmten Tag prüfen:

```powershell
./pruefen.ps1 -Tag tag1
```

> Hinweis: Was du nur lokal hast, aber noch nicht gepusht hast, sieht GitHub nicht. Der grüne Haken auf GitHub
> zählt – vergiss also `git push` nicht.

### Fehlermeldung "Ausführung von Skripts ist auf diesem System deaktiviert"

Windows blockiert Skripte standardmässig. Die Meldung sieht etwa so aus:

```text
.\pruefen.ps1 kann nicht geladen werden, da die Ausführung von Skripts auf diesem System deaktiviert ist.
```

Erlaube Skripte **für deinen Benutzer** (einmalig, keine Administratorrechte nötig):

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Bestätige mit `J` (bzw. `Y`) und Enter. Danach `./pruefen.ps1` nochmals ausführen.

**macOS:** Installiere PowerShell mit `brew install powershell`. Danach im Terminal: `pwsh ./pruefen.ps1`

---

## Kontrolle

1. `git status` zeigt: `nothing to commit, working tree clean` – alles ist committet.
2. `git log --oneline -3` zeigt deine letzten Commits.
3. Im Reiter **Actions** ist der oberste Lauf ✅ grün.

✅ Grüner Haken? **Dann bist du für heute fertig.** 🎉

## Wenn es nicht klappt

**`nothing to commit, working tree clean`, obwohl ich etwas geändert habe**

- Hast du die Datei gespeichert (**Ctrl + S**)? In VS Code zeigt ein weisser Punkt im Reiter ungespeicherte Dateien.
- Bist du im richtigen Ordner? `pwd` zeigt den aktuellen Ordner.

**`fatal: not a git repository`**

- Du bist nicht im Ordner deines Kurs-Repositories. Wechsle hinein: `cd C:\GitHub\HF26-<Vorname>`

**`Author identity unknown – Please tell me who you are`**

- Git ist noch nicht konfiguriert. Mach [Anleitung 03](03_git-konfigurieren.md).

**`! [rejected] main -> main (fetch first)`**

- Auf GitHub gibt es Änderungen, die du lokal nicht hast. Hole sie zuerst:

  ```powershell
  git pull
  git push
  ```

**Bei `git commit` öffnet sich ein Editor statt einer Bestätigung**

- Du hast `-m "…"` vergessen. In VS Code: Nachricht in die erste Zeile schreiben, speichern, Tab schliessen.
  In Vim: `Esc`, dann `:q!` und Enter – und den Befehl nochmals mit `-m "…"` eingeben.

**Im Reiter Actions erscheint gar nichts**

- Warte eine Minute und lade die Seite neu.
- Steht dort "Workflows aren't being run on this repository", klicke auf
  **I understand my workflows, go ahead and enable them**.
- Hast du wirklich gepusht? `git status` zeigt `Your branch is ahead of 'origin/main'`, wenn noch etwas fehlt.

**Der Check ist rot, aber ich finde den Fehler nicht**

- Öffne die Details-Seite und lies die Tabelle genau – jede ❌-Zeile sagt, was fehlt.
- Führe `./pruefen.ps1` lokal aus.
- Frag die Lehrperson und zeig ihr die Details-Seite.

**Ich habe aus Versehen `bin/`- oder `obj/`-Ordner committet**

- Das ist nicht schlimm. Die Vorlage enthält eine `.gitignore`, die diese Ordner normalerweise ausschliesst.
  Wenn sie trotzdem drin sind, frag die Lehrperson.
