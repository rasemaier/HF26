# Übung Tag 1 – 28.11.2026

Heute richtest du deinen Laptop ein, erstellst dein Kurs-Repository und schreibst dein erstes C#-Programm.

Die Folien von heute findest du im selben Ordner ([Tag1.pdf](Tag1.pdf)).

**Du bist fertig, wenn dein Repository auf GitHub einen grünen Haken ✅ hat.**
Die genaue Liste steht unten unter [Checkliste: fertig wenn …](#checkliste-fertig-wenn-).

> **Frist: Montag, 30.11.2026, 23:59.** Grün bis zur Frist = **2 Punkte** für die Prüfung,
> grün bis 07.12.2026 = 1 Punkt. Nicht fertig geworden? Arbeite zu Hause weiter und pushe bis zur Frist.
> Details: [Punkte für die Prüfung](../README.md#punkte-für-die-prüfung).

---

## Aufgabe 1: Laptop einrichten

Arbeite diese Anleitungen durch (was du schon zu Hause gemacht hast, kannst du überspringen):

- [ ] [01 – Git installieren](../anleitungen/01_git-installieren.md)
- [ ] [02 – GitHub-Account erstellen](../anleitungen/02_github-account.md)
- [ ] [03 – Git konfigurieren](../anleitungen/03_git-konfigurieren.md)
- [ ] [05 – .NET, Visual Studio und VS Code](../anleitungen/05_dotnet-visual-studio.md)
- [ ] optional: [07 – KI-Tools](../anleitungen/07_ki-tools.md)

## Aufgabe 2: Kurs-Repository erstellen

Folge [Anleitung 04 – Kurs-Repository erstellen](../anleitungen/04_kurs-repo-erstellen.md):

1. Repository `HF26-<Vorname>` aus der Vorlage `rasemaier/HF26-Vorlage` erstellen ("Use this template").
2. `rasemaier` als Collaborator einladen.
3. Repository klonen und in VS Code öffnen.

## Aufgabe 3: Lerntagebuch (README.md)

Die Datei `README.md` in deinem Kurs-Repository ist dein **Lerntagebuch**.

1. Ersetze in der ersten Zeile `[Dein Name]` durch deinen Namen:

   ```markdown
   # HF26 – Lerntagebuch von Anna Muster
   ```

2. Schreibe unter die Überschrift `## Tag 1 – 28.11.2026` **mindestens 3 Sätze oder Stichpunkte**
   (je mindestens 3 Wörter): **Was habe ich heute gelernt?** Zum Beispiel:

   ```markdown
   ## Tag 1 – 28.11.2026

   - Git speichert jede Version meiner Dateien, und mit GitHub lade ich sie hoch.
   - Mit `dotnet new console` erstelle ich ein neues C#-Programm.
   - Docker startet Programme in Containern, so musste ich PostgreSQL nicht installieren.
   - Am schwierigsten fand ich ...
   ```

   Schreib in deinen eigenen Worten – auch was schwierig war oder was du noch nicht verstehst.
3. Speichern, dann committen und pushen:

   ```powershell
   git add README.md
   git commit -m "Tag 1: Lerntagebuch"
   git push
   ```

## Aufgabe 4: Dein erstes C#-Programm – `Tag1/HelloWorld`

Erstelle eine Konsolen-App, die sich vorstellt.

1. Öffne das Terminal in deinem Kurs-Repository (in VS Code: **Terminal → New Terminal**).
2. Erstelle das Projekt im Ordner `Tag1/HelloWorld`:

   ```powershell
   dotnet new console -o Tag1/HelloWorld
   ```

   (Du kannst das Projekt auch in Visual Studio erstellen: **Neues Projekt erstellen** → **Konsolen-App** →
   Projektname `HelloWorld`, Speicherort `C:\GitHub\HF26-<Vorname>\Tag1`, Häkchen bei
   "Projektmappe und Projekt im selben Verzeichnis platzieren" setzen.)
3. Öffne die Datei `Tag1/HelloWorld/Program.cs`. Darin steht:

   ```csharp
   // See https://aka.ms/new-console-template for more information
   Console.WriteLine("Hello, World!");
   ```

4. Ändere das Programm so, dass es
   - deinen Namen in einer Variablen vom Typ `string` speichert,
   - dein Alter in einer Variablen vom Typ `int` speichert,
   - genau diesen Satz ausgibt (mit deinen Werten):

   ```text
   Hallo, ich bin Anna und 23 Jahre alt
   ```

   **Tipp:** Texte und Variablen verbindest du mit `+`, zum Beispiel `"Ich heisse " + name`.
5. Starte das Programm:

   ```powershell
   dotnet run --project Tag1/HelloWorld
   ```

6. Wenn die Ausgabe stimmt: committen und pushen.

   ```powershell
   git add Tag1
   git commit -m "Tag 1: HelloWorld gibt Name und Alter aus"
   git push
   ```

> **Wichtig:** Das Programm darf **nicht** auf eine Eingabe warten (kein `Console.ReadLine()` in `HelloWorld`).
> Der automatische Check startet dein Programm und würde sonst ewig warten.

## Aufgabe 5: Docker – `Tag1/docker.txt`

Folge [Anleitung 06 – Docker und PostgreSQL](../anleitungen/06_docker-postgresql.md):

1. WSL2 und Docker Desktop installieren (Teil A).
2. `docker run hello-world` ausführen und die Ausgabe in `Tag1/docker.txt` speichern:

   ```powershell
   docker run hello-world | Out-File -FilePath Tag1\docker.txt -Encoding utf8
   ```

3. Prüfen, dass in der Datei `Hello from Docker!` steht, dann committen und pushen.
4. PostgreSQL starten und dich damit verbinden (Teil B und C). Das brauchen wir an Tag 4 –
   wenn du es heute schaffst, umso besser.

## Aufgabe 6: Abgeben und Check prüfen

Folge [Anleitung 08 – Abgabe und automatischer Check](../anleitungen/08_abgabe-und-check.md):

1. Alles committen und pushen.
2. Auf GitHub im Reiter **Actions** nachsehen: grüner Haken ✅?
3. Bei ❌: Details-Seite öffnen, Tabelle lesen, fehlende Punkte erledigen, nochmals pushen.

---

## Checkliste: fertig wenn …

- [ ] **README:** Der Platzhalter `[Dein Name]` ist durch deinen Namen ersetzt.
- [ ] **README:** Unter `## Tag 1` stehen **mindestens 3 Sätze oder Stichpunkte** zu "Was habe ich heute gelernt?".
- [ ] **`Tag1/HelloWorld`** ist eine C#-Konsolen-App, die ohne Fehler kompiliert.
- [ ] Die App gibt **"Hallo, ich bin &lt;Name&gt; und &lt;Alter&gt; Jahre alt"** aus (mit deinem Namen und Alter).
- [ ] **`Tag1/docker.txt`** existiert und enthält **"Hello from Docker!"**.
- [ ] Du hast **mindestens 2 eigene Commits** von deinem Laptop gepusht.
  (Änderungen direkt auf der GitHub-Webseite zählen nicht.)
- [ ] Auf GitHub ist im Reiter **Actions** der neueste Lauf **✅ grün**.

Lokal vorab prüfen:

```powershell
./pruefen.ps1
```

✅ **Alles grün? Dann bist du für heute fertig und darfst gehen.** 🎉

---

## Für Schnelle (freiwillig, wird nicht geprüft)

Diese Zusatzaufgaben machst du in einem **eigenen Projekt**, z. B. `Tag1/Bonus`, damit `HelloWorld` unverändert bleibt:

```powershell
dotnet new console -o Tag1/Bonus
```

1. **Eingabe:** Frag Name und Alter mit `Console.ReadLine()` ab, statt sie fest einzutragen.
   Tipp: `int.Parse(...)` wandelt Text in eine Zahl um.
2. **Rechnen:** Gib zusätzlich aus, in welchem Jahr du geboren bist (ungefähr).
   Tipp: `DateTime.Now.Year` liefert das aktuelle Jahr.
3. **Bedingung:** Gib "Du bist volljährig" oder "Du bist noch nicht volljährig" aus (`if` / `else`).
4. **Datenbank:** Verbinde dich mit deiner PostgreSQL-Datenbank (Anleitung 06, Teil C) und führe
   `SELECT version();` aus.
5. **KI ausprobieren:** Lass dir von einem KI-Tool deinen Code Zeile für Zeile erklären
   (siehe [Anleitung 07](../anleitungen/07_ki-tools.md)). Stimmt die Erklärung?
