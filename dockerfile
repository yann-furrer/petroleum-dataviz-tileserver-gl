# Utiliser l'image officielle de TileServer GL
FROM klokantech/tileserver-gl

# Installer curl pour télécharger le fichier
RUN apt-get update && apt-get install -y curl && apt-get clean

# Ajouter une commande pour télécharger le fichier pipeline.mbtile depuis GitHub
# Remplacez `<URL_DU_FICHIER_PIPELINE>` par le lien brut de votre fichier pipeline.mbtile sur GitHub
RUN curl -L -o /data/pipeline.mbtile 'https://github.com/yann-furrer/petroleum-dataviz-tileserver-gl/blob/main/pipeline.mbtiles'

# Définir le répertoire de travail
WORKDIR /data

# Exposer le port 80 pour le service
EXPOSE 80

# Commande pour démarrer le serveur avec l'option --mbtiles et le fichier pipeline.mbtile
CMD ["tileserver-gl", "--mbtiles", "pipeline.mbtile"]
