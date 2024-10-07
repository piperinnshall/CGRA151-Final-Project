ArrayList<Entity> entities;
Player player;
Keys keys;
Images images;
Map map;

void setupGame() {
    entities = new ArrayList<Entity>();

    player = new Player(WIDTH / 2, HEIGHT / 2, 50, -1, 30);
    entities.add(player);

    images = new Images("8BITCanariPackTopDown/TILESET/PixelPackTOPDOWN8BIT.png", 16, 16);
    keys = new Keys();
    map = new Map("Maps/Map1.txt");

}

void debug() {
    textSize(32);
    fill(0);
    String text = "x: " + map.x + " y: " + map.y;
    text(text, width - textWidth(text) - 10, 40);
}
