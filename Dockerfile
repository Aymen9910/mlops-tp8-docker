
# Image Python legere
FROM python:3.12-slim

# Repertoire de travail dans le conteneur
WORKDIR /app

# Copier et installer les dependances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code et le modele
COPY api/ ./api/
COPY models/ ./models/

# Port utilise par FastAPI
EXPOSE 8000

# Demarrer le serveur
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "8000"]
