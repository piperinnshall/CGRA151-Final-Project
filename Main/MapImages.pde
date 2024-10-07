class Images {
    PImage tileset;
    PImage[] tiles;
    int tileWidth;
    int tileHeight;
    int cols;
    int rows;

    Images(String path, int tileWidth, int tileHeight) {
        this.tileset = loadImage(path);
        this.tileWidth = tileWidth;
        this.tileHeight = tileHeight;
        this.cols = tileset.width / tileWidth;
        this.rows = tileset.height / tileHeight;
        this.tiles = new PImage[cols * rows];
        setup();
    }

    void setup() {
        for (int y = 0; y < rows; y++) {
            for (int x = 0; x < cols; x++) {
                int tileX = x * tileWidth;
                int tileY = y * tileHeight;
                tiles[y * cols + x] = tileset.get(tileX, tileY, tileWidth, tileHeight);
            }
        }
    }

    PImage getTile(int index) {
        if (index >= 0 && index < tiles.length) {
            return tiles[index];
        } else {
            return null;
        }
    }
}

