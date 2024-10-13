ArrayList<Entity> entities;
Player player;
Tileset tileset;
Map map;
Parallax parallax;
Menu menu;
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
        String[] parallaxPaths = 
            new String[] {
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg1.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg2.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg3.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg4.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg5.png",
                "ScifiSpaceAssetsNAv1/PremadeParallax/PremadeParallax3/bg6.png"
            };
        String[] fontPaths = 
            new String[] {
                "MOOD MKII Outline.ttf",
                "MOOD MKII.ttf",
                "MOOD Outline.ttf",
                "MOOD.ttf",
                "MiniMOOD Outline.ttf",
                "MiniMOOD.ttf",
                "NewHiScore.ttf",
            };

        tileset = new Tileset(tilesetPath, 16, 16);
        map = new Map(mapPath);
        parallax = new Parallax(parallaxPaths);
        menu = new Menu(fontPaths);
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
        float size = 120;
        float rotationSpeed = 0.03;
        PVector camera = new PVector(WIDTH / 2, HEIGHT / 2);

        player = new Player(rotation, acceleration, deceleration, health, size, maxSpeed, maxReverse, rotationSpeed, camera);
        entities.add(player);
    }
}
