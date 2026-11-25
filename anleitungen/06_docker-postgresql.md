# 06 – Docker und PostgreSQL

**Ziel:** Auf deinem Laptop läuft eine PostgreSQL-Datenbank in Docker, und du kannst dich mit ihr verbinden.

**Dauer:** ca. 30–45 Minuten (inkl. Neustart)

## Was ist Docker? Was ist PostgreSQL?

- **PostgreSQL** ist eine Datenbank. Darin speichern unsere Programme später Daten (z. B. eine Liste von Produkten).
- **Docker** startet Programme in sogenannten **Containern**. Ein Container ist wie eine kleine, abgeschlossene Box,
  in der ein Programm mit allem läuft, was es braucht. Vorteil: Wir müssen PostgreSQL nicht kompliziert
  installieren – ein Befehl genügt, und bei allen im Kurs läuft genau die gleiche Version.
- **WSL2** (Windows-Subsystem für Linux) braucht Docker unter Windows im Hintergrund.

**Voraussetzungen:** mindestens 8 GB RAM, ca. 10 GB freier Speicher und

- **Windows:** Windows 10 (64-bit) oder Windows 11
- **macOS:** ein aktuelles macOS (Docker unterstützt die neueste und die zwei vorherigen Versionen). WSL brauchst du nicht.

---

## Teil A: Docker installieren

### Schritt 1: WSL2 installieren (nur Windows)

1. Drücke die **Windows-Taste**, tippe `PowerShell`.
2. **Rechtsklick** auf **Windows PowerShell** → **Als Administrator ausführen** → **Ja**.
3. Gib ein:

   ```powershell
   wsl --install
   ```

4. Warte, bis die Installation fertig ist. Eventuell wirst du nach einem Linux-Benutzernamen und Passwort gefragt –
   wähle etwas Einfaches und merke es dir (das brauchst du im Kurs nicht).
5. **Starte den Laptop neu.**
6. Prüfe nach dem Neustart in PowerShell:

   ```powershell
   wsl --status
   ```

   Dort sollte **Standardversion: 2** (bzw. *Default Version: 2*) stehen.

### Schritt 2: Docker Desktop installieren

#### Windows

**Variante A – mit winget:**

```powershell
winget install --id Docker.DockerDesktop -e
```

**Variante B – Download:** <https://www.docker.com/products/docker-desktop/> → **Download for Windows – AMD64**
(bzw. **ARM64** bei Snapdragon-Laptops) → Datei öffnen.

Im Installer:

- ✅ **Use WSL 2 instead of Hyper-V (recommended)** angehakt lassen
- ✅ **Add shortcut to desktop** nach Wunsch
- → **Ok**, warten, dann **Close and log out** bzw. **Close and restart**

#### macOS

1. Öffne <https://www.docker.com/products/docker-desktop/> → **Download for Mac** und wähle deinen Chip:
   **Apple Silicon** (Chip «Apple M…») oder **Intel Chip**. Welchen du hast, siehst du unter
   Apple-Menü → **Über diesen Mac**.
2. Die `.dmg`-Datei öffnen und **Docker** in den Ordner **Programme** ziehen.

### Schritt 3: Docker Desktop zum ersten Mal starten

1. Starte **Docker Desktop**:
   - Windows: Windows-Taste → "Docker Desktop"
   - macOS: Cmd + Leertaste → "Docker". Beim ersten Start **Use recommended settings** → **Finish** und
     dein Mac-Passwort eingeben.
2. **Docker Subscription Service Agreement:** Lies die Bedingungen und klicke auf **Accept**
   (für Ausbildung und private Nutzung ist Docker Desktop kostenlos).
3. Die Anmeldung kannst du mit **Skip** überspringen. Die Umfrage ebenfalls mit **Skip**.
4. Warte, bis unten links **Engine running** (grün) steht.

### Schritt 4: Docker testen – `hello-world`

Öffne PowerShell (normal, nicht als Administrator; Mac: Terminal) und gib ein:

```powershell
docker run hello-world
```

Docker lädt ein winziges Test-Programm herunter und startet es. In der Ausgabe steht unter anderem:

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

### Schritt 5: Ausgabe in `Tag1/docker.txt` speichern

Diese Ausgabe ist dein Nachweis, dass Docker läuft. Er zählt für den **Check von Tag 2**
(Frist Freitag, 11.12.2026). Wechsle in dein Kurs-Repository, speichere sie in eine Datei und prüfe den Inhalt.
Ersetze `HF26-Anna` durch den Namen deines Repositories.

#### Windows

```powershell
cd C:\GitHub\HF26-Anna
docker run hello-world | Out-File -FilePath Tag1\docker.txt -Encoding utf8
Get-Content Tag1\docker.txt
```

#### macOS

```bash
cd ~/GitHub/HF26-Anna
docker run hello-world > Tag1/docker.txt
cat Tag1/docker.txt
```

Darin muss `Hello from Docker!` stehen. Danach mit `git add`, `git commit` und `git push` abgeben
(siehe [Anleitung 08](08_abgabe-und-check.md)).

---

## Teil B: PostgreSQL mit Docker Compose

Die Einstellungen für die Datenbank stehen in einer Datei `docker-compose.yml`. Diese ist im Kurs-Repository
schon vorbereitet: [docker-compose.yml](docker-compose.yml)

### Schritt 1: Ordner anlegen und Datei herunterladen

Wir legen die Datenbank-Datei in einen eigenen Ordner (nicht in dein Kurs-Repository):

#### Windows

```powershell
mkdir C:\GitHub\HF26-postgres
cd C:\GitHub\HF26-postgres
Invoke-WebRequest -Uri https://raw.githubusercontent.com/rasemaier/HF26/main/anleitungen/docker-compose.yml -OutFile docker-compose.yml
```

#### macOS

```bash
mkdir -p ~/GitHub/HF26-postgres
cd ~/GitHub/HF26-postgres
curl -o docker-compose.yml https://raw.githubusercontent.com/rasemaier/HF26/main/anleitungen/docker-compose.yml
```

### Schritt 2: Kurs-Passwort eintragen

1. Öffne die Datei in VS Code:

   ```powershell
   code docker-compose.yml
   ```

2. Suche die Zeile

   ```yaml
   POSTGRES_PASSWORD: KURS_PASSWORT_HIER
   ```

3. Ersetze `KURS_PASSWORT_HIER` durch das **Kurs-Passwort**, das die Lehrperson im Kurs bekannt gibt.
4. Speichern (**Ctrl + S**, Mac: **Cmd + S**).

> **Wichtig:** Das Passwort wird nur beim **allerersten** Start der Datenbank gesetzt. Trage es also ein,
> **bevor** du die Datenbank startest.

Die Datei legt Folgendes fest:

| Einstellung | Wert | Bedeutung |
| --- | --- | --- |
| `image` | `postgres:17` | PostgreSQL Version 17 |
| `container_name` | `hf26-postgres` | Name des Containers |
| `POSTGRES_USER` | `hf26` | Benutzername |
| `POSTGRES_PASSWORD` | Kurs-Passwort | Passwort |
| `POSTGRES_DB` | `hf26` | Name der Datenbank |
| `ports` | `5432:5432` | Die Datenbank ist auf deinem Laptop unter Port 5432 erreichbar |
| `volumes` | `hf26-pgdata` | Hier werden die Daten gespeichert – sie bleiben erhalten, auch wenn der Container gestoppt wird |

### Schritt 3: Datenbank starten

Im Ordner `C:\GitHub\HF26-postgres` (Mac: `~/GitHub/HF26-postgres`):

```powershell
docker compose up -d
```

(`-d` heisst: im Hintergrund laufen lassen.) Beim ersten Mal wird PostgreSQL heruntergeladen (ca. 150 MB).

Status prüfen:

```powershell
docker compose ps
```

In der Spalte **STATUS** muss `Up … (healthy)` stehen. Steht dort `(health: starting)`, warte ein paar Sekunden
und prüfe nochmals.

### Schritt 4: Datenbank stoppen und wieder starten

Immer im Ordner `C:\GitHub\HF26-postgres` (Mac: `~/GitHub/HF26-postgres`):

| Was? | Befehl |
| --- | --- |
| Starten | `docker compose up -d` |
| Stoppen (Daten bleiben) | `docker compose stop` |
| Wieder starten | `docker compose start` |
| Status anzeigen | `docker compose ps` |
| Protokoll anzeigen (bei Problemen) | `docker compose logs` |
| Container entfernen (Daten bleiben im Volume) | `docker compose down` |

> ⚠️ `docker compose down -v` löscht **alle Daten** der Datenbank. Nur verwenden, wenn du wirklich neu anfangen willst.

Die Datenbank startet automatisch, sobald Docker Desktop läuft (ausser du hast sie mit `docker compose stop` gestoppt).

---

## Teil C: Mit der Datenbank verbinden

Wähle **eine** der beiden Varianten.

### Variante 1: VS Code mit der Erweiterung "PostgreSQL" (von Microsoft)

1. VS Code öffnen → links **Extensions** (**Ctrl + Shift + X**, Mac: **Cmd + Shift + X**).
2. `PostgreSQL` suchen. Wähle den Eintrag **PostgreSQL** von **Microsoft** (mit blauem Häkchen) → **Install**.
3. Links erscheint ein neues Symbol (ein Elefant). Darauf klicken.
4. Auf **Add Connection** (bzw. das **+**) klicken und ausfüllen:

   | Feld | Wert |
   | --- | --- |
   | Server name | `localhost` |
   | Port | `5432` |
   | Authentication type | Password |
   | User name | `hf26` |
   | Password | das Kurs-Passwort |
   | Save password | ✅ |
   | Database name | `hf26` |
   | Connection name | `HF26` |

5. **Test Connection** → es sollte "Connection successful" erscheinen → **Connect**.

### Variante 2: pgAdmin

1. pgAdmin installieren:

   ```powershell
   winget install --id PostgreSQL.pgAdmin -e
   ```

   oder Download von <https://www.pgadmin.org/download/> (Mac: **pgAdmin 4 for macOS** → `.dmg`).
2. pgAdmin starten. Links mit der rechten Maustaste auf **Servers** → **Register** → **Server…**
3. Reiter **General**: Name `HF26`
4. Reiter **Connection**:

   | Feld | Wert |
   | --- | --- |
   | Host name/address | `localhost` |
   | Port | `5432` |
   | Maintenance database | `hf26` |
   | Username | `hf26` |
   | Password | das Kurs-Passwort |
   | Save password? | ✅ |

5. **Save**. Links erscheint der Server **HF26**.

---

## Kontrolle

**1. Docker:**

```powershell
docker --version
Get-Content C:\GitHub\HF26-Anna\Tag1\docker.txt
```

(Mac: `cat ~/GitHub/HF26-Anna/Tag1/docker.txt`)

Die erste Zeile zeigt eine Version, z. B. `Docker version 29.0.1`. Die Datei enthält `Hello from Docker!`.

**2. PostgreSQL läuft:**

```powershell
docker exec hf26-postgres psql -U hf26 -d hf26 -c "SELECT version();"
```

Erwartete Ausgabe (gekürzt):

```text
                         version
---------------------------------------------------------
 PostgreSQL 17.x (Debian 17.x-1.pgdg…) on x86_64-pc-linux-gnu, …
(1 row)
```

**3. Verbindung aus VS Code oder pgAdmin:** Öffne ein neues Abfragefenster
(VS Code: Rechtsklick auf die Verbindung → **New Query**; pgAdmin: Rechtsklick auf `hf26` → **Query Tool**)
und führe aus:

```sql
SELECT version();
```

✅ Siehst du die PostgreSQL-Version? Dann bist du fertig.

## Wenn es nicht klappt

**`wsl --install` meldet, dass die Virtualisierung nicht aktiviert ist** (z. B. `0x80370102`)

- Die Virtualisierung muss im **BIOS/UEFI** eingeschaltet werden. Je nach Hersteller heisst sie
  **Intel VT-x**, **Intel Virtualization Technology**, **AMD-V** oder **SVM Mode**.
  Laptop neu starten, beim Start **F2**, **F10**, **Del** oder **Esc** drücken (je nach Hersteller), Option suchen,
  auf **Enabled** stellen, speichern. Frag im Zweifel die Lehrperson.

**Docker Desktop meldet "WSL needs updating" oder "WSL 2 installation is incomplete"**

- In PowerShell (als Administrator): `wsl --update`, danach Laptop neu starten.

**`docker: error during connect` oder `… dockerDesktopLinuxEngine: The system cannot find the file specified`**
(Mac: `Cannot connect to the Docker daemon at unix:///…/docker.sock`)

- Docker Desktop läuft nicht. Starte Docker Desktop und warte, bis **Engine running** erscheint.

**`docker : Die Benennung "docker" wurde nicht … erkannt`**

- PowerShell schliessen und neu öffnen. Hilft das nicht: abmelden und wieder anmelden bzw. Laptop neu starten.
- Mac (`command not found: docker`): Docker Desktop einmal starten (es richtet den Befehl ein), dann das Terminal
  schliessen (Cmd + Q) und neu öffnen.

**In `Tag1/docker.txt` steht nur komischer Text oder die Datei ist leer**

- Docker lief beim Befehl nicht. Starte Docker Desktop und führe den Befehl aus Teil A, Schritt 5 nochmals aus.

**`Bind for 0.0.0.0:5432 failed: port is already allocated`**

- Auf deinem Laptop läuft schon eine andere Datenbank auf Port 5432 (z. B. ein früher installiertes PostgreSQL).
  Ändere in der `docker-compose.yml` die Zeile auf `- "5433:5432"` und verwende beim Verbinden Port **5433**.
  Dann `docker compose up -d` nochmals ausführen.

**`password authentication failed for user "hf26"`**

- Falsches Passwort eingegeben – prüfe Gross-/Kleinschreibung.
- Du hast das Passwort in der `docker-compose.yml` geändert, **nachdem** die Datenbank schon einmal gestartet war.
  Das neue Passwort gilt dann nicht. Lösung (⚠️ löscht alle Daten der Datenbank):

  ```powershell
  cd C:\GitHub\HF26-postgres
  docker compose down -v
  docker compose up -d
  ```

  (Mac: zuerst `cd ~/GitHub/HF26-postgres`, die beiden `docker compose`-Befehle sind gleich.)

**`no configuration file provided: not found`**

- Du bist nicht im richtigen Ordner. Zuerst `cd C:\GitHub\HF26-postgres` (Mac: `cd ~/GitHub/HF26-postgres`).

**Docker Desktop ist sehr langsam oder der Laptop wird heiss**

- Docker Desktop braucht viel Arbeitsspeicher. Beende Docker Desktop, wenn du es nicht brauchst:
  - Windows: Rechtsklick auf das Wal-Symbol unten rechts → **Quit Docker Desktop**
  - macOS: Klick auf das Wal-Symbol oben in der Menüleiste → **Quit Docker Desktop**
