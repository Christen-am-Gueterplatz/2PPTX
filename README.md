<div align="center">
  <img src=".github/assets/logo.png" alt="Christen am Güterplatz" width="112" height="112">
  <h1>PDF zu PowerPoint</h1>
  <p>PDF-Seiten als Präsentation für WorshipTools Presenter aufbereiten.</p>
  <img alt="Python" src="https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white">
  <img alt="Flask" src="https://img.shields.io/badge/Flask-000000?logo=flask&logoColor=white">
  <img alt="Docker" src="https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white">
  <p><a href="https://www.christen-am-gueterplatz.de">Gemeindewebseite</a> · <a href="https://github.com/Christen-am-Gueterplatz">Unsere Projekte</a></p>
</div>

## Überblick

Wandelt jede PDF-Seite in eine bildbasierte PowerPoint-Folie im Format 1920 × 1080 um. Die Weboberfläche ist passwortgeschützt; freie Flächen erhalten einen schwarzen Hintergrund.

## Technik

Python und Flask, PyMuPDF für PDF-Seiten, Pillow für Bilder und `python-pptx` für Präsentationen. Docker Compose startet die Anwendung mit Gunicorn.

## Schnellstart

1. [.env.example](.env.example) als `.env` kopieren.
2. Ein eigenes `APP_PASSWORD` und einen langen zufälligen `SECRET_KEY` setzen.
3. Container bauen und starten:

```sh
docker compose up --build -d
```

Die Oberfläche ist unter [localhost:5000](http://localhost:5000) erreichbar. PDF hochladen, umwandeln und die fertige PPTX herunterladen.

## Konfiguration und Betrieb

| Variable        | Bedeutung                                                    |
| --------------- | ------------------------------------------------------------ |
| `APP_PASSWORD`  | Passwort der Weboberfläche; den Standard `password` ersetzen |
| `SECRET_KEY`    | Zufälliger geheimer Schlüssel für Sitzungen                  |
| `MAX_UPLOAD_MB` | Upload-Limit in MB; standardmäßig 500                        |

Für einen öffentlichen Betrieb HTTPS über einen Reverse Proxy einrichten. Die Folien enthalten gerenderte Seitenbilder; einzelne Texte sind anschließend nicht als PowerPoint-Textfelder bearbeitbar.

Alternativ lokal: `pip install -r requirements.txt`, danach `flask run --host=127.0.0.1 --port=5000`. Für diese Entwicklungssitzung gegebenenfalls eine virtuelle Python-Umgebung verwenden.

Das zuvor im Projekt referenzierte Ausgangsrepository ist [rwiebe/2PPTX](https://github.com/rwiebe/2PPTX).
