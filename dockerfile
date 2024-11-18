# Utiliser l'image officielle de tileserver-gl comme base
FROM klokantech/tileserver-gl

# Installer curl pour télécharger le fichier .mbtiles
RUN apk add --no-cache curl

# Définir une variable pour l'URL du fichier .mbtiles
ENV MBTILES_URL="https://github.com/yann-furrer/petroleum-dataviz-tileserver-gl/blob/main/pipeline.mbtiles"

# Télécharger le fichier .mbtiles et le placer dans le répertoire /data
RUN mkdir -p /data && \
    curl -o /data/pipeline.mbtiles $MBTILES_URL

# Exposer le port 8080
EXPOSE 8080

# Commande par défaut pour démarrer tileserver-gl
CMD ["tileserver-gl", "--port", "8080", "--verbose"]
