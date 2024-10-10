ArrayList<Entity> entities;
Player player;
Keys keys;
Mouse mouse;
Tileset tileset;
Map map;
Parallax parallax;

class Game {
    Game() {
        loadAssets();
        loadInputs();

        entities = new ArrayList<Entity>();
        player = new Player(PI/3.0, 20, -1, 30);
        entities.add(player);
    }

    private void loadAssets() {
        String tilesetPath = "8BITCanariPackTopDown/TILESET/PixelPackTOPDOWN8BIT.png";
        String mapPath = "Maps/Map1.txt";

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
        map.moveDev();
        map.move();
        map.update();

        for (Entity entity : entities) {
            entity.render();
            entity.move();
            entity.update();
        }

        textSize(32);
        fill(255);
        String text = "x: " + map.position.x + " y: " + map.position.y;
        text(text, width - textWidth(text) - 10, 40);

        if (keys.actions.get("DRAW-SHEET")) tileset.draw(28);
        if (keys.actions.get("ZOOM-IN")) map.zoom(5);
        if (keys.actions.get("ZOOM-OUT")) map.zoom(-5);

    }
}


