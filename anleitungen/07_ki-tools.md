# 07 – KI-Tools beim Programmieren

**Ziel:** Du weisst, wie du KI im Kurs sinnvoll und sicher einsetzen kannst.

## Die Regeln im Kurs

- **KI ist erlaubt** – im Unterricht, bei den Übungen und auch in der Prüfung.
- **KI ist freiwillig.** Du kannst den ganzen Kurs auch ohne KI bestehen.
- **Jede und jeder organisiert das eigene Tool selbst.** Die Schule stellt kein KI-Tool zur Verfügung und
  übernimmt keine Kosten. Es gibt kein "offizielles" Kurs-Tool – nimm das, womit du gut zurechtkommst.
- **Du bist verantwortlich für deinen Code.** Auch wenn ihn eine KI geschrieben hat, musst du ihn erklären können.

---

## Welche Arten von KI-Tools gibt es?

Die folgende Liste ist **keine Empfehlung**, sondern eine Übersicht (alphabetisch). Viele Tools haben eine
kostenlose Version mit Einschränkungen. Angebote und Preise ändern sich oft – informiere dich selbst.

### Chat-Tools im Browser

Du stellst eine Frage in einem Chatfenster und kopierst Antworten bei Bedarf in deinen Code.

- ChatGPT (OpenAI)
- Claude (Anthropic)
- Gemini (Google)
- Le Chat (Mistral)
- Microsoft Copilot

**Gut für:** Konzepte erklären lassen, Fehlermeldungen verstehen, Ideen sammeln.

### KI im Editor

Die KI ist direkt in den Editor eingebaut. Sie schlägt beim Tippen Code vor, beantwortet Fragen zum offenen
Projekt und kann Dateien ändern.

- Cursor (eigener Editor, basiert auf VS Code)
- GitHub Copilot (Erweiterung für VS Code und Visual Studio; für verifizierte Studierende über das
  [Student Developer Pack](02_github-account.md#schritt-4-optional-github-student-developer-pack) kostenlos)
- Weitere Erweiterungen für VS Code, z. B. Continue oder Cline

**Gut für:** schneller tippen, Code im Zusammenhang mit dem ganzen Projekt verstehen.

### KI lokal auf dem eigenen Laptop

Mit Programmen wie LM Studio oder Ollama läuft ein KI-Modell direkt auf deinem Laptop.
Deine Daten verlassen den Laptop nicht. Dafür brauchst du einen leistungsstarken Laptop, und die Antworten
sind meist schwächer als bei den grossen Online-Diensten.

---

## Datenschutz: Was gehört NICHT in eine KI?

Alles, was du in ein Online-KI-Tool eingibst, wird an eine Firma geschickt und dort eventuell gespeichert oder
zum Trainieren verwendet. Gib deshalb **nie** ein:

- ❌ **Passwörter** – auch nicht das Kurs-Passwort der Datenbank
- ❌ **Zugangsdaten**: API-Keys, Tokens, Verbindungszeichenfolgen mit Passwort (z. B. `Password=…`)
- ❌ **Personendaten**: Namen, Adressen, Telefonnummern, Geburtsdaten von dir oder anderen Personen
  (z. B. Mitschülerinnen und Mitschülern, Kundinnen und Kunden)
- ❌ **Vertrauliches aus deinem Lehrbetrieb oder deiner Firma**: Firmen-Code, interne Dokumente, Kundendaten

So machst du es richtig:

- Ersetze heikle Werte durch Platzhalter, z. B. `Password=GEHEIM` statt dem echten Passwort.
- Verwende Beispieldaten wie "Anna Muster, Musterstrasse 1, 8000 Zürich".
- Schau in den Einstellungen deines Tools nach, ob du das Training mit deinen Daten ausschalten kannst.

---

## Code verstehen statt nur kopieren

KI-Tools machen Fehler. Sie erfinden manchmal Funktionen, die es nicht gibt, oder verwenden veraltete Versionen
(z. B. altes .NET). Und in der Prüfung musst du verstehen, was dein Code macht.

**Faustregel:** Übernimm nur Code, den du einer Mitschülerin oder einem Mitschüler erklären könntest.

So lernst du mit KI am meisten:

1. **Zuerst selbst versuchen.** Frag die KI erst, wenn du nicht weiterkommst.
2. **Nach einem Tipp fragen, nicht nach der Lösung.** "Gib mir nur einen Hinweis, keine fertige Lösung."
3. **Erklären lassen.** "Erkläre mir diesen Code Zeile für Zeile."
4. **Selbst abtippen statt kopieren.** Beim Abtippen merkst du, was du nicht verstehst.
5. **Testen.** Führe den Code aus. Funktioniert er wirklich? Auch mit anderen Eingaben?
6. **Im Lerntagebuch festhalten,** was du dabei gelernt hast.

---

## Gute Prompts schreiben

Ein **Prompt** ist deine Frage oder Anweisung an die KI. Je genauer du fragst, desto besser die Antwort.

Ein guter Prompt enthält:

- **Kontext:** Was machst du? Welche Sprache, welche Version? ("C#, .NET 10, Konsolenanwendung")
- **Ziel:** Was soll am Ende herauskommen?
- **Was du schon hast:** deinen Code und die **genaue Fehlermeldung** (kopieren, nicht abschreiben)
- **Wie du die Antwort willst:** "Erkläre es für Anfänger", "nur einen Tipp", "kurz"

### Beispiel 1: Fehlermeldung verstehen

❌ Schlecht:

```text
geht nicht
```

✅ Gut:

```text
Ich lerne C# mit .NET 10 und bin Anfänger. Mein Programm soll Name und Alter ausgeben.
Beim Ausführen von "dotnet run" kommt dieser Fehler:

Program.cs(3,13): error CS0029: Cannot implicitly convert type 'string' to 'int'

Das ist mein Code:
int alter = "23";
Console.WriteLine(alter);

Erkläre mir bitte, was der Fehler bedeutet und wie ich ihn selbst beheben kann.
```

### Beispiel 2: Konzept erklären lassen

❌ Schlecht:

```text
was ist eine variable
```

✅ Gut:

```text
Erkläre mir als Programmier-Anfänger, was eine Variable in C# ist.
Verwende ein Beispiel aus dem Alltag und zeige mir dann ein kurzes Code-Beispiel mit int und string.
```

### Beispiel 3: Hilfe bei einer Aufgabe, ohne die Lösung zu verraten

✅ Gut:

```text
Ich soll in C# eine Konsolenanwendung schreiben, die "Hallo, ich bin <Name> und <Alter> Jahre alt" ausgibt.
Name und Alter sollen in Variablen stehen. Gib mir bitte KEINE fertige Lösung,
sondern nur Schritt für Schritt Hinweise, was ich tun muss.
```

### Beispiel 4: Git-Problem

✅ Gut:

```text
Ich arbeite unter Windows mit Git in PowerShell. Bei "git push" kommt:

! [rejected]        main -> main (fetch first)

Was bedeutet das, und welche Befehle muss ich ausführen? Erkläre jeden Befehl kurz.
```

---

## Kontrolle

Beantworte für dich diese Fragen:

- Welches KI-Tool (wenn überhaupt) möchte ich ausprobieren?
- Welche drei Arten von Daten gebe ich nie in eine KI ein?
- Wie frage ich nach einem Hinweis statt nach der fertigen Lösung?

✅ Kannst du alle drei beantworten? Dann bist du bereit.

## Wenn es nicht klappt

**Die KI gibt mir Code, der nicht funktioniert**

- Kopiere die **genaue Fehlermeldung** zurück in den Chat und schreibe dazu, was du erwartet hast.
- Frag nach: "Welche .NET-Version setzt dein Code voraus?" Oft ist der Code veraltet.
- Vergleiche mit der offiziellen Dokumentation: <https://learn.microsoft.com/dotnet/csharp/>

**Die KI widerspricht sich oder erfindet Dinge**

- Das passiert. Stelle die Frage neu und genauer, oder prüfe die Antwort in der Dokumentation.

**Das kostenlose Kontingent ist aufgebraucht**

- Warte bis zum nächsten Tag, wechsle auf ein anderes Tool – oder arbeite ohne KI weiter. Für den Kurs brauchst du keine KI.

**Ich habe aus Versehen ein Passwort in eine KI eingegeben**

- Ändere das Passwort sofort. Lösche den Chat-Verlauf. Beim Kurs-Passwort: Sag es der Lehrperson.
