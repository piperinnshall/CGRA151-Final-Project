ArrayList<Entity> entities;
Player player;
Keys keys;
Map map;

void setupGame() {
    entities = new ArrayList<Entity>();
    player = new Player(WIDTH / 2, HEIGHT / 2, 10, -1, 30);
    map = new Map();
    keys = new Keys();

    entities.add(player);

    keys.setup();
    map.setup("Map.txt");
}

void debug() {
    textSize(32);
    String text = "x: " + map.x + " y: " + map.y;
    float textWidthValue = textWidth(text);
    fill(0);

    text(text, width - textWidthValue - 10, 40);
}
