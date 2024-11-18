# Base image from TileServer GL
FROM klokantech/tileserver-gl

# Copy your MBTiles file into the container
COPY data/pipeline.mbtiles ./data/pipeline.mbtiles

# Set the environment variable for the MBTiles file
ENV TILESERVER_CONFIG=/data/pipeline.mbtiles

# Expose the TileServer GL default port
EXPOSE 8080

# Start the TileServer GL
CMD ["tileserver-gl","--mbtiles", "/data/pipeline.mbtiles"]
