# Base image with TileServer GL
FROM klokantech/tileserver-gl

# Set the working directory
WORKDIR /data

# Clone the GitHub repository and copy the .mbtiles file
RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/username/repo-name.git /tmp/repo \
    && cp /tmp/repo/data/pipeline.mbtiles /data/pipeline.mbtiles \
    && rm -rf /tmp/repo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Expose the default port for TileServer GL
EXPOSE 80

# Start the TileServer GL
CMD ["tileserver-gl", "--config", "/data/config.json", "--port", "80", '--mbtiles', "data/pipeline.mbtiles"]
