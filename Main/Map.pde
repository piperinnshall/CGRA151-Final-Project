class Map {
    private String path;
    private int[][] layout;
    private float tileSize;
    private PVector position;

    Map(String path) {
        this.path = path;
        setup();
    }

    void setup() {
        tileSize = 64;
        position = new PVector(0, 0);

        try {
            String[] lines = loadStrings("Maps/" + path + ".txt");

            if (lines == null || lines.length == 0) {
                throw new Exception("File could not be read: " + path);
            }

            layout = new int[lines.length][];

            for (int i = 0; i < lines.length; i++) {
                String[] numbers = split(lines[i], ' ');
                layout[i] = new int[numbers.length];

                for (int j = 0; j < numbers.length; j++) {
                    layout[i][j] = Integer.parseInt(numbers[j]);
                }
            }

        } catch (Exception e) {
            println("An error occurred: " + e.getMessage());
        }
    }

    void render() {
        for (int i = 0; i < layout.length; i++) {
            for (int j = 0; j < layout[i].length; j++) {
                PImage tile = tileset.getTile(layout[i][j]);

                float tileX = j * tileSize - position.x;
                float tileY = i * tileSize - position.y;

                float centeredX = tileX + player.camera.x;
                float centeredY = tileY + player.camera.y;

                if (tile != null &&
                        centeredX + tileSize > 0 && centeredX < width &&
                        centeredY + tileSize > 0 && centeredY < height) {
                    image(tile, centeredX, centeredY, tileSize, tileSize);
                }
            }
        }
    }

    void move() {
        position.add(new PVector(-player.currentSpeed * cos(player.rotation), -player.currentSpeed * sin(player.rotation)));
    }

    void move(int dist) {
        if (keys.actions.get("map up")) map.position.y -= dist;
        if (keys.actions.get("map down")) map.position.y += dist;
        if (keys.actions.get("map left")) map.position.x -= dist;
        if (keys.actions.get("map right")) map.position.x += dist;
        if (keys.actions.get("zoom out")) map.tileSize -= 2;
        if (keys.actions.get("zoom in")) map.tileSize += 2;
        if (keys.actions.get("draw sheet")) tileset.draw(28);
        if (keys.actions.get("reload")) map.setup();
    }

    void update() {
        position.set(constrain(position.x, 0, layout[0].length * tileSize), constrain(position.y, 0, layout.length * tileSize));

        tileSize = constrain(tileSize, 20, 1000);
    }

    void save() {
        String[] lines = new String[layout.length];

        for (int i = 0; i < layout.length; i++) {
            String[] stringRow = new String[layout[i].length];
            for (int j = 0; j < layout[i].length; j++) {
                stringRow[j] = String.valueOf(layout[i][j]);
            }
            lines[i] = join(stringRow, " ");
        }

        try {
            saveStrings("Maps/" + path + ".txt", lines);
        } catch (Exception e) {
            println("An error occurred: " + e.getMessage());
        }
    }
}
