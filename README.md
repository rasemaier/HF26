# HF26 – Grundlagen IT

Willkommen im Kurs **Grundlagen IT**! In diesem Repository findest du alles, was du für den Kurs brauchst:
Folien, Übungen und Schritt-für-Schritt-Anleitungen.

Du brauchst **keine Vorkenntnisse**. Wir starten bei null und gehen alles gemeinsam durch.

## Was lernen wir?

- **Git und GitHub** – Code speichern, Versionen verwalten, Arbeit abgeben
- **C#** – unsere Programmiersprache
- **Blazor** – Web-Anwendungen mit C# bauen
- **Docker und PostgreSQL** – eine Datenbank auf dem eigenen Laptop betreiben
- **KI-Tools** – sinnvoll und kritisch beim Programmieren einsetzen

## Termine

| Tag        | Datum                | Form                     | Material                                   |
| ---------- | -------------------- | ------------------------ | ------------------------------------------ |
| Tag 1      | Samstag, 28.11.2026  | vor Ort                  | [tag1_20261128](tag1_20261128/)            |
| Tag 2      | Dienstag, 01.12.2026 | vor Ort                  | erscheint am Kurstag                       |
| Tag 3      | Samstag, 12.12.2026  | **Blended / remote** (Abgabe 14.12.) | erscheint am Kurstag           |
| Tag 4      | Dienstag, 15.12.2026 | vor Ort                  | erscheint am Kurstag                       |
| Tag 5      | Samstag, 19.12.2026  | vor Ort                  | erscheint am Kurstag                       |
| **Prüfung**| Samstag, 09.01.2027  | vor Ort                  | siehe [Prüfungsregeln](#prüfungsregeln)    |

## Wie funktioniert dieses Repository?

- Für jeden Kurstag gibt es einen Ordner, z. B. `tag1_20261128` (Tag 1 vom 28.11.2026).
- **Neue Tage erscheinen jeweils am Kurstag.** Vorher ist der Ordner noch nicht da – das ist Absicht.
- Im Tag-Ordner findest du die Folien (PDF) und die Übung (`Uebung_TagN.md`).
- Deine eigene Arbeit machst du **nicht hier**, sondern in deinem eigenen Kurs-Repository
  (siehe [Anleitung 04](anleitungen/04_kurs-repo-erstellen.md)).

**Tipp:** Du kannst dieses Repository einmal auf deinen Laptop holen und am Kurstag aktualisieren:

```powershell
cd C:\GitHub
git clone https://github.com/rasemaier/HF26.git
```

Am nächsten Kurstag holst du die neuen Dateien so:

```powershell
cd C:\GitHub\HF26
git pull
```

Du kannst die Dateien aber auch einfach hier auf der GitHub-Webseite anschauen.

## Anleitungen

Arbeite die Anleitungen **der Reihe nach** durch. Jede Anleitung hat am Ende einen Kontrollbefehl
und einen Abschnitt "Wenn es nicht klappt".

| Nr. | Anleitung                                                           | Wann?                 |
| --- | ------------------------------------------------------------------- | --------------------- |
| 01  | [Git installieren](anleitungen/01_git-installieren.md)              | vor Tag 1             |
| 02  | [GitHub-Account erstellen](anleitungen/02_github-account.md)        | vor Tag 1             |
| 03  | [Git konfigurieren](anleitungen/03_git-konfigurieren.md)            | vor Tag 1             |
| 04  | [Kurs-Repository erstellen](anleitungen/04_kurs-repo-erstellen.md)  | Tag 1                 |
| 05  | [.NET und Visual Studio](anleitungen/05_dotnet-visual-studio.md)    | vor Tag 1             |
| 06  | [Docker und PostgreSQL](anleitungen/06_docker-postgresql.md)        | nach Tag 1, zu Hause  |
| 07  | [KI-Tools](anleitungen/07_ki-tools.md)                              | freiwillig            |
| 08  | [Abgabe und automatischer Check](anleitungen/08_abgabe-und-check.md) | jeden Kurstag        |

> **Vor Tag 1:** Bitte installiere zu Hause schon Git (01), erstelle deinen GitHub-Account (02),
> konfiguriere Git (03) und installiere .NET und Visual Studio (05). Die Downloads sind gross –
> im Kursraum mit vielen Leuten gleichzeitig dauert das sehr lange.

## Wann bin ich fertig?

Du bist mit einem Kurstag fertig, wenn bei deinem Kurs-Repository auf GitHub ein **grüner Haken ✅** erscheint.

1. Du löst die Übung des Tages (z. B. [Uebung_Tag1.md](tag1_20261128/Uebung_Tag1.md)).
2. Du lädst deine Arbeit mit `git add`, `git commit` und `git push` hoch.
3. GitHub prüft deine Abgabe automatisch (das dauert ca. 1 Minute).
4. **Grüner Haken ✅ = fertig, du darfst gehen.**
   **Rotes Kreuz ❌ = es fehlt noch etwas.** Auf der Details-Seite siehst du in einer Tabelle, was fehlt.

Du kannst auch vorher auf deinem Laptop prüfen, ob alles stimmt:

```powershell
./pruefen.ps1
```

Wie das genau geht, steht in [Anleitung 08](anleitungen/08_abgabe-und-check.md).

**Nicht fertig geworden?** Kein Problem: Du kannst zu Hause weiterarbeiten und bis zur Frist pushen
(siehe [Punkte für die Prüfung](#punkte-für-die-prüfung)). Wenn du irgendwo hängen bleibst, melde dich
**vor** der Frist bei der Lehrperson.

## Punkte für die Prüfung

Mit den Kurstagen sammelst du **bis zu 18 Punkte (+2 Bonus)**, die zur Prüfung am 09.01.2027 zählen.

| Was | Punkte | Frist (jeweils 23:59) |
| --- | ------ | --------------------- |
| Tag 1 – Check grün | 2 | Montag, 30.11.2026 |
| Tag 2 – Check grün | 2 | Freitag, 11.12.2026 |
| Tag 3 – Blended Learning (Video) | 10 (+2 Bonus) | Montag, 14.12.2026 |
| Tag 4 – Check grün | 2 | Freitag, 18.12.2026 |
| Tag 5 – Check grün | 2 | Freitag, 08.01.2027 |
| **Total** | **18 (+2)** | |

So zählen die Tages-Checks (Tag 1, 2, 4, 5):

- **Grün bis zur Frist:** 2 Punkte
- **Grün bis 1 Woche nach der Frist:** 1 Punkt (bei Tag 5 gibt es keine Nachfrist, weil am nächsten Tag die Prüfung ist)
- **Später oder nie grün:** 0 Punkte

Es zählt der Zeitpunkt, an dem dein Check auf GitHub **zum ersten Mal grün** war, also wann du gepusht hast.
Wenn danach etwas wieder rot wird, verlierst du die Punkte nicht.

Die Aufgabe für Tag 3 (Video) erscheint am Kurstag in diesem Repository.

## Prüfungsregeln

Die Prüfung findet am **Samstag, 09.01.2027** statt.

**Erlaubt ist alles – ausser Kommunikationstools.**

Erlaubt:

- dein eigener Laptop
- alle deine Unterlagen, dein Kurs-Repository und dieses Repository
- das Internet (Dokumentation, Suchmaschinen, Stack Overflow usw.)
- KI-Tools (siehe [Anleitung 07](anleitungen/07_ki-tools.md))

Nicht erlaubt:

- jede Kommunikation mit anderen Personen: Messenger (WhatsApp, Signal, Telegram …), E-Mail,
  Teams, Slack, Discord, soziale Netzwerke, Foren-Posts, Telefon
- gemeinsam bearbeitete Dokumente oder Repositories mit anderen Personen
- Code von Mitschülerinnen und Mitschülern weitergeben oder übernehmen

Wer Kommunikationstools nutzt, wird von der Prüfung ausgeschlossen.

**Wichtig:** Stelle vor der Prüfung sicher, dass auf deinem Laptop alles läuft (Git, .NET, Visual Studio,
Docker, PostgreSQL). Während der Prüfung gibt es keine Zeit für Installationen.

## Hilfe

- Lies zuerst den Abschnitt **"Wenn es nicht klappt"** in der passenden Anleitung.
- Frag deine Nachbarin oder deinen Nachbarn (ausser in der Prüfung 😉).
- Frag die Lehrperson – es gibt keine dummen Fragen.
