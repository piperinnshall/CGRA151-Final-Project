class Map {
    private String path;
    private int[][] map;
    private float x, y;
    private float tileSize = 64;

    Map(String path) {
        this.path = path;
        setup();
    }

    void setup() {
        try {
            String[] lines = loadStrings(path);
            if (lines == null || lines.length == 0) {
                throw new Exception("File could not be read: " + path);
            }

            map = new int[lines.length][];

            for (int i = 0; i < lines.length; i++) {
                String[] numbers = split(lines[i], ' ');
                map[i] = new int[numbers.length];

                for (int j = 0; j < numbers.length; j++) {
                    map[i][j] = Integer.parseInt(numbers[j]);
                }
            }
        } catch (Exception e) {
            println("An error occurred: " + e.getMessage());
        }
    }

    void render() {
        noSmooth();

        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                PImage tile = images.getTile(map[i][j]);

                float tileX = j * tileSize - x;
                float tileY = i * tileSize - y;

                float centeredX = WIDTH / 2 + tileX;
                float centeredY = WIDTH / 2 + tileY;

                if (tile != null) {
                    image(tile, centeredX, centeredY, tileSize, tileSize);
                }
            }
        } 
    }

    void move() {
        int activeActions = 0;
        float speedMultiplier = 1.0;

        for (String action : keys.actions.keySet()) {
            if (keys.actions.get(action)) {
                activeActions++;
            }
        }

        if (activeActions > 1) {
            speedMultiplier = 1.0 / sqrt(2);
        }

        if (keys.actions.get("MOVE-UP")) moveY(-player.speed * speedMultiplier);
        if (keys.actions.get("MOVE-DOWN")) moveY(player.speed * speedMultiplier);
        if (keys.actions.get("MOVE-LEFT")) moveX(-player.speed * speedMultiplier);
        if (keys.actions.get("MOVE-RIGHT")) moveX(player.speed * speedMultiplier);
    }

    void update() {
        x = constrain(x, 0, map[0].length * tileSize); 
        y = constrain(y, 0, map.length * tileSize); 
    }

    private void moveX(float speed) {
        x += speed;
    }

    private void moveY(float speed) {
        y += speed;
    }

    void printer() {
        if (map == null) return;

        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                print(map[i][j] + " ");
            }
            println();
        }
    }
}

