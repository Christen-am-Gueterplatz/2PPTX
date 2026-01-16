# 2PPTX – PDF-zu-PPTX-Konverter für WorshipTools Presenter

🧭 Motivation

WorshipTools Presenter unterstützt aktuell keine PDF-Dateien. Da wir jedoch häufig Präsentationen im PDF-Format erhalten, stellte das ein erhebliches Problem im Ablauf dar. Manuelles Konvertieren war unpraktisch und zeitaufwendig.

2PPTX wurde als Lösung für genau dieses Problem entwickelt. Das Tool wandelt PDF-Dateien automatisch in kompatible PowerPoint-Präsentationen (.pptx) um – optimiert für den Einsatz in Presenter.

✨ Funktionen
	•	� Passwortschutz – Sicherer Zugriff auf das Tool
	•	�🖤 Schwarzer Hintergrund jeder Folie (passend zur dunklen Oberfläche von Presenter und keine störendes weiß an der Leinwand)
	•	🖼️ Automatische Bildskalierung auf Full-HD-Auflösung (1920x1080)
	•	📁 Jede PDF-Seite wird zu einer PPTX-Folie
	•	🖥️ Webbasierte Benutzeroberfläche – keine Kommandozeile notwendig
	•	🐳 Docker-basiert – läuft containerisiert und isoliert

🚀 Nutzung

Das Tool startet einen lokalen Webserver, der über den Browser aufgerufen wird.

## 1. Passwort konfigurieren

Erstellen Sie eine `.env` Datei im Projektverzeichnis:

```bash
# .env Datei erstellen
echo APP_PASSWORD=IhrSicheresPasswort > .env
```

Oder kopieren Sie die Beispieldatei und passen Sie das Passwort an:

```bash
cp .env.example .env
# Dann .env editieren und APP_PASSWORD anpassen
```

**Standard-Passwort:** `password` (bitte in Produktion ändern!)

## 2. Container starten

Mit docker-compose (empfohlen):

```bash
docker-compose up --build
```

Oder manuell mit Docker:

```bash
# Image bauen
docker build -t 2pptx .

# Container starten (mit .env Datei)
docker run -p 5000:5000 --env-file .env 2pptx
```

## 3. Web-UI aufrufen

```
http://localhost:5000
```

Sie werden zur Login-Seite weitergeleitet. Geben Sie das in der `.env` Datei konfigurierte Passwort ein.

## 4. PDF hochladen

Lade deine PDF-Datei hoch und erhalte eine fertige .pptx, optimiert für WorshipTools.

📦 Installation lokal (Alternativ zur Docker-Nutzung)

```bash
git clone https://github.com/rwiebe/2PPTX.git
cd 2PPTX

# .env Datei erstellen und Passwort setzen
cp .env.example .env
# .env editieren und APP_PASSWORD anpassen

# Dependencies installieren
pip install -r requirements.txt

# App starten
flask run --host=0.0.0.0 --port=5000
```

Web-UI aufrufen:

```
http://localhost:5000
```

🔐 Sicherheit

- **Passwort ändern:** Das Standard-Passwort `password` sollte in Produktion unbedingt geändert werden
- **HTTPS verwenden:** In Produktionsumgebungen sollte HTTPS verwendet werden (z.B. mit einem Reverse Proxy wie nginx)
- **Secret Key:** Für Produktion sollte auch `SECRET_KEY` in der `.env` gesetzt werden:
  ```
  SECRET_KEY=ein-sehr-langer-zufälliger-string
  APP_PASSWORD=IhrSicheresPasswort
  ```

