class Tileset {
    PImage setImage;
    PImage[] tiles;
    int tileWidth;
    int tileHeight;
    int cols;
    int rows;

    Tileset(String path, int tileWidth, int tileHeight) {
        this.setImage = loadImage(path);
        this.tileWidth = tileWidth;
        this.tileHeight = tileHeight;
        this.cols = setImage.width / tileWidth;
        this.rows = setImage.height / tileHeight;
        this.tiles = new PImage[cols * rows];
        setup();
    }

    void setup() {
        for (int y = 0; y < rows; y++) {
            for (int x = 0; x < cols; x++) {
                int tileX = x * tileWidth;
                int tileY = y * tileHeight;
                tiles[y * cols + x] = setImage.get(tileX, tileY, tileWidth, tileHeight);
            }
        }
    }

    void draw(int tileSize) {
        textAlign(CENTER, CENTER);
        fill(255);
        for (int y = 0; y < rows; y++) {
            for (int x = 0; x < cols; x++) {
                int index = y * cols + x;
                int tileX = x * tileSize;
                int tileY = y * tileSize;

                image(tiles[index], tileX, tileY, tileSize, tileSize);

                fill(255);
                textSize(10);
                text(index, tileX + tileSize / 2, tileY + tileSize / 2);
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
