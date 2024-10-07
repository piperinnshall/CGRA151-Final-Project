ArrayList<Entity> entities;
Player player;
Keys keys;
MapImages mapImages;
Map map;

void setupGame() {
    entities = new ArrayList<Entity>();

    player = new Player(WIDTH / 2, HEIGHT / 2, 50, -1, 30);
    entities.add(player);

    mapImages = new MapImages();
    keys = new Keys();
    map = new Map();


    keys.setup();
    map.setup("Maps/Map1.txt");
}

void debug() {
    textSize(32);
    fill(0);
    String text = "x: " + map.x + " y: " + map.y;
    text(text, width - textWidth(text) - 10, 40);
}
