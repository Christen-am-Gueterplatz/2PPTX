# Dockerfile - Production Ready

FROM python:3.9-slim

# Systemabhängigkeiten installieren (für PyMuPDF)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Non-root User erstellen für Sicherheit
RUN useradd -m -u 1000 appuser && \
    mkdir -p /app && \
    chown -R appuser:appuser /app

WORKDIR /app

# Requirements installieren (als root, aber global)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Anwendungscode kopieren
COPY --chown=appuser:appuser . .

# Environment Variablen für Production
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    FLASK_ENV=production

# Port freigeben
EXPOSE 5000

# Auf non-root User wechseln
USER appuser

# Gunicorn mit Production Settings
CMD ["gunicorn", \
    "--workers", "4", \
    "--threads", "2", \
    "--timeout", "120", \
    "--bind", "0.0.0.0:5000", \
    "--access-logfile", "-", \
    "--error-logfile", "-", \
    "--log-level", "info", \
    "app:app"]
