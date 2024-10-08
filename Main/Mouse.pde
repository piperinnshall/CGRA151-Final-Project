int drawTile = 0;

void mouseDragged() {
    if (!keys.actions.get("DRAW-SHEET")) {
        drawTileAtMouse();
    }
}

void mousePressed() {
    if (keys.actions.get("DRAW-SHEET")) {
        selectTile();
    } else {
        drawTileAtMouse();
    }
}

void selectTile() {
    int tileSize = 28;
    int tileX = mouseX / tileSize;
    int tileY = mouseY / tileSize;

    if (tileX >= 0 && tileX < tileset.cols && tileY >= 0 && tileY < tileset.rows) {
        drawTile = tileY * tileset.cols + tileX;
    }
}

void drawTileAtMouse() {
    if (!keys.actions.get("DRAW-SHEET")) {
        float centeredX = mouseX + map.x - (WIDTH / 2);
        float centeredY = mouseY + map.y - (HEIGHT / 2);

        int tileX = (int) (centeredX / map.tileSize);
        int tileY = (int) (centeredY / map.tileSize);

        if (tileX >= 0 && tileX < map.map[0].length && tileY >= 0 && tileY < map.map.length) {
            map.map[tileY][tileX] = drawTile;
            map.save("Maps/Map1.txt");
        }
    }
}
