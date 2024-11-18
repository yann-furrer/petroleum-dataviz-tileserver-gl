# Utiliser l'image officielle de TileServer GL
FROM klokantech/tileserver-gl



# Installer curl en utilisant le gestionnaire de paquets adapté (apk pour Alpine Linux)



# Ajouter une commande pour télécharger le fichier pipeline.mbtile depuis GitHub

ADD 'https://github.com/yann-furrer/petroleum-dataviz-tileserver-gl/blob/main/pipeline.mbtiles' /data/pipeline.mbtile 

# Définir le répertoire de travail
WORKDIR /data

# Exposer le port 80 pour le service
EXPOSE 80

# Commande pour démarrer le serveur avec l'option --mbtiles et le fichier pipeline.mbtile
CMD ["tileserver-gl", "--mbtiles", "pipeline.mbtile"]
