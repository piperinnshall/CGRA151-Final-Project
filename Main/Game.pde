ArrayList<Entity> entities;
Player player;
Keys keys;
Tileset tileset;
Map map;

void setupGame() {
    entities = new ArrayList<Entity>();

    player = new Player(WIDTH / 2, HEIGHT / 2, 50, -1, 30);
    entities.add(player);

    tileset = new Tileset("8BITCanariPackTopDown/TILESET/PixelPackTOPDOWN8BIT.png", 16, 16);
    keys = new Keys();
    map = new Map("Maps/Map1.txt");

}

void debug() {
    textSize(32);
    fill(255);
    String text = "x: " + map.x + " y: " + map.y;
    text(text, width - textWidth(text) - 10, 40);

    if (keys.actions.get("DRAW-SHEET")) tileset.drawTileset(28);
    if (keys.actions.get("LOAD-MAP")) map.setup();
    if (keys.actions.get("ZOOM-IN")) map.zoom(5);
    if (keys.actions.get("ZOOM-OUT")) map.zoom(-5);
}
