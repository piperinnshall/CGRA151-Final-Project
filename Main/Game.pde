ArrayList<Entity> entities;
Player player;
Tileset tileset;
Map map;
Parallax parallax;
Keys keys;
Mouse mouse;

class Game {
    Game() {
        loadAssets();
        loadInputs();
        loadEntities();
    }

    private void loadAssets() {
        String tilesetPath = "8BITCanariPackTopDown/TILESET/PixelPackTOPDOWN8BIT.png";
        String mapPath = "Maps/Map2";
        String[] parallaxPaths = new String[] {
            "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg1.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg2.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg3.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg4.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg5.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg6.png"
        };

        tileset = new Tileset(tilesetPath, 16, 16);
        map = new Map(mapPath);
        parallax = new Parallax(parallaxPaths);
    }

    private void loadInputs() {
        keys = new Keys();
        mouse = new Mouse();
    }

    private void loadEntities() {
        entities = new ArrayList<Entity>();

        float rotation = 0;
        float maxSpeed = 30;
        float maxReverse = 15;
        float timeToMaxSpeed = 4.0;
        float acceleration = maxSpeed / (60 * timeToMaxSpeed);
        float deceleration = acceleration * 2;
        float health = 0;
        float size = 160;
        float rotationSpeed = 0.03;
        PVector camera = new PVector(WIDTH / 2, HEIGHT / 2);

        player = new Player(rotation, acceleration, deceleration, health, size, maxSpeed, maxReverse, rotationSpeed, camera);
        entities.add(player);
    }

    void run() {
        //parallax.render();
        //parallax.update();

        map.render();
        map.move();
        map.update();

        for (Entity entity : entities) {
            //entity.render();
            //entity.move();
            //entity.update();
        }
    }

    void dev() {
        //parallax.render();
        //parallax.update();

        map.render();
        map.move();
        map.update();

        for (Entity entity : entities) {
            entity.render();
            entity.move();
            entity.update();
        }

        textSize(32);
        fill(255, 0, 0);
        String text = "wattesigma";
        // String text = "x: " + map.position.x + " y: " + map.position.y + " size: " + map.tileSize;
        text(text, width - textWidth(text) - 10, 40);

        if (keys.actions.get("DRAW-SHEET")) tileset.draw(28);
        if (keys.actions.get("RELOAD")) map.setup();
        if (keys.actions.get("ZOOM-IN")) map.tileSize += 2;
        if (keys.actions.get("ZOOM-OUT")) map.tileSize -= 2;
        if (keys.actions.get("MOVE-UP")) map.position.y -= 20;
        if (keys.actions.get("MOVE-DOWN")) map.position.y += 20;
        if (keys.actions.get("MOVE-LEFT")) map.position.x -= 20;
        if (keys.actions.get("MOVE-RIGHT")) map.position.x += 20;
    }
}
