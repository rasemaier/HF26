# 02 – GitHub-Account erstellen

**Ziel:** Du hast einen GitHub-Account mit Zwei-Faktor-Authentifizierung (2FA) und kannst dich einloggen.

**Dauer:** ca. 15 Minuten

## Was ist GitHub?

GitHub ist eine Webseite, auf der du deine Git-Repositories online speicherst. Ein **Repository** (kurz "Repo")
ist ein Projektordner, dessen Versionen Git verwaltet. Über GitHub gibst du im Kurs deine Übungen ab, und
GitHub prüft sie automatisch.

---

## Schritt 1: Registrieren

1. Öffne <https://github.com/signup>.
2. **E-Mail-Adresse:** Gib eine E-Mail ein, die du regelmässig liest.
   Tipp: Eine private Adresse ist besser als die Schul- oder Firmenadresse – den Account behältst du nach dem Kurs.
   Die Schuladresse kannst du später zusätzlich hinzufügen (z. B. für das Student Developer Pack).
3. **Passwort:** Mindestens 15 Zeichen, oder mindestens 8 Zeichen mit einer Zahl und einem Kleinbuchstaben.
   Verwende ein Passwort, das du sonst **nirgends** benutzt. Ein Passwort-Manager hilft.
4. **Username:** siehe [Schritt 2](#schritt-2-einen-sinnvollen-username-wählen).
5. **Your Country/Region:** Switzerland.
6. Klicke auf **Continue** / **Create account**.
7. Löse das Rätsel ("Verify your account").
8. GitHub schickt dir einen **Code per E-Mail**. Gib ihn ein.
9. Logge dich mit Username (oder E-Mail) und Passwort ein.
10. Die Fragen zur Personalisierung kannst du überspringen (**Skip personalization**).
11. Wähle den **kostenlosen Plan (Free)**. Du musst nichts bezahlen.

## Schritt 2: Einen sinnvollen Username wählen

Dein Username ist **öffentlich** und erscheint in allen Links, z. B. `https://github.com/anna-muster`.
Viele Firmen schauen sich bei Bewerbungen das GitHub-Profil an.

✅ Gute Beispiele:

- `anna-muster`
- `amuster`
- `anna-muster-dev`

❌ Schlechte Beispiele:

- `xX_DarkGamer_Xx` – wirkt unprofessionell
- `anna1998` – verrät dein Alter
- `user123456` – niemand erkennt dich

Regeln: nur Buchstaben, Zahlen und einzelne Bindestriche, kein Leerzeichen. Den Username kannst du später
ändern, aber dann funktionieren alte Links nicht mehr – also lieber gleich gut wählen.

## Schritt 3: Zwei-Faktor-Authentifizierung (2FA) einschalten

Mit 2FA brauchst du zum Einloggen zusätzlich zum Passwort einen Code vom Handy. Das schützt deinen Account,
und GitHub verlangt es ohnehin für alle, die Code hochladen.

**Vorbereitung:** Installiere auf deinem Handy eine Authenticator-App, z. B. **Microsoft Authenticator**,
**Google Authenticator** oder **GitHub Mobile** (alle kostenlos).

1. Klicke auf GitHub oben rechts auf dein **Profilbild** → **Settings**.
2. Links im Menü: **Password and authentication**.
3. Unter "Two-factor authentication" auf **Enable two-factor authentication** klicken.
4. GitHub zeigt einen **QR-Code**. Öffne die Authenticator-App auf dem Handy, tippe auf **+** /
   **Konto hinzufügen** und scanne den QR-Code.
5. Die App zeigt jetzt einen 6-stelligen Code. Gib ihn auf GitHub ein → **Continue**.
6. **Recovery codes:** GitHub zeigt dir Wiederherstellungscodes. **Das ist sehr wichtig!**
   Klicke auf **Download** und speichere die Datei an einem sicheren Ort (z. B. im Passwort-Manager oder
   ausgedruckt zu Hause). Ohne diese Codes kommst du nicht mehr in deinen Account, wenn du dein Handy verlierst.
7. Klicke auf **I have saved my recovery codes** → **Done**.

## Schritt 4 (optional): GitHub Student Developer Pack

Als Studierende oder Studierender bekommst du viele Werkzeuge gratis (z. B. GitHub Copilot, Cloud-Guthaben,
Lizenzen für Entwicklungswerkzeuge). Das ist **freiwillig** und für den Kurs nicht nötig.

1. Öffne <https://education.github.com/pack> → **Sign up for Student Developer Pack**.
2. Füge zuerst unter **Settings → Emails** deine Schul-E-Mail-Adresse hinzu und bestätige sie.
3. Fülle den Antrag aus: Schule auswählen, Schul-E-Mail angeben.
4. GitHub verlangt meist einen **Nachweis**, z. B. ein Foto deines Studierendenausweises mit aktuellem Datum.
   Das Foto wird direkt mit der Kamera aufgenommen.
5. Die Prüfung dauert ein paar Minuten bis einige Tage. Du bekommst eine E-Mail.

---

## Kontrolle

1. Logge dich aus (Profilbild → **Sign out**) und wieder ein.
2. Nach dem Passwort fragt GitHub nach dem **6-stelligen Code** aus der Authenticator-App.
3. Öffne `https://github.com/<dein-username>` – das ist dein Profil.

✅ Hat das geklappt? Weiter mit [03 – Git konfigurieren](03_git-konfigurieren.md).

## Wenn es nicht klappt

**Die E-Mail mit dem Code kommt nicht an**

- Schau im **Spam-Ordner** nach.
- Warte 5 Minuten und klicke dann auf **Resend the code**.
- Bei Schul- oder Firmenadressen blockiert manchmal ein Filter die E-Mail. Nimm eine private Adresse.

**"Username is not available"**

- Der Name ist schon vergeben. Probiere eine Variante, z. B. mit Bindestrich oder zweitem Vornamen.

**Der Code aus der Authenticator-App wird nicht akzeptiert**

- Die Uhrzeit auf dem Handy muss stimmen. Stelle "Datum und Uhrzeit automatisch" ein.
- Nimm immer den **aktuellen** Code – er wechselt alle 30 Sekunden.

**Ich habe mein Handy verloren / gewechselt**

- Beim Einloggen auf **Use a recovery code** klicken und einen deiner Recovery Codes eingeben.
- Danach unter **Settings → Password and authentication** die 2FA mit dem neuen Handy neu einrichten.

**Der Antrag für das Student Developer Pack wurde abgelehnt**

- Häufigster Grund: Das Foto des Ausweises ist unscharf oder es ist kein aktuelles Datum sichtbar.
  Einfach nochmals mit einem besseren Foto beantragen. Für den Kurs brauchst du das Pack nicht.
