# Utiliser une image de base légère compatible avec Debian
FROM node:19-slim

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Installer tileserver-gl
RUN npm install -g tileserver-gl

# Définir une variable pour l'URL du fichier .mbtiles
ENV MBTILES_URL="https://github.com/yann-furrer/petroleum-dataviz-tileserver-gl/blob/main/pipeline.mbtiles"

# Créer un répertoire pour stocker les fichiers .mbtiles
RUN mkdir -p /data

# Télécharger le fichier .mbtiles
RUN curl -L -o /data/pipeline.mbtiles $MBTILES_URL

# Exposer le port 8080
EXPOSE 8080

# Lancer tileserver-gl sur le port 8080
CMD ["tileserver-gl", "--port", "8080", "--verbose"]
