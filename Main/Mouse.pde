class Mouse {
    int drawTile = 0;

    void selectTile() {
        int tileSize = 28;
        int tileX = mouseX / tileSize;
        int tileY = mouseY / tileSize;

        if (tileX >= 0 && tileX < tileset.cols && tileY >= 0 && tileY < tileset.rows) {
            drawTile = tileY * tileset.cols + tileX;
        }
    }

    void drawTile() {
        if (!keys.actions.get("DRAW-SHEET")) {
            float centeredX = mouseX + map.position.x - (player.camera.x);
            float centeredY = mouseY + map.position.y - (player.camera.y);

            int tileX = (int) (centeredX / map.tileSize);
            int tileY = (int) (centeredY / map.tileSize);

            if (tileX >= 0 && tileX < map.layout[0].length && tileY >= 0 && tileY < map.layout.length) {
                map.layout[tileY][tileX] = drawTile;
                map.save();
            }
        }
    }
}

void mouseDragged() {
    if (!keys.actions.get("DRAW-SHEET")) {
        mouse.drawTile();
    }
}

void mousePressed() {
    if (keys.actions.get("DRAW-SHEET")) {
        mouse.selectTile();
    } else {
        mouse.drawTile();
    }
}

