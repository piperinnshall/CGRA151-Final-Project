class Map {
    private PVector position;
    private String path;
    private int[][] layout;
    private float tileSize = 96;

    Map(String path) {
        this.path = path;
        setup();
    }

    void setup() {
        position = new PVector(0, 0);

        try {
            String[] lines = loadStrings(path);

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

                float centeredX = tileX + player.position.x;
                float centeredY = tileY + player.position.y;

                if (tile != null) {
                    image(tile, centeredX, centeredY, tileSize, tileSize);
                }
            }
        }
    }

    void move() {
        float dx = player.currentSpeed * cos(player.rotation);
        float dy = player.currentSpeed * sin(player.rotation);

        moveX(-dx);
        moveY(-dy);
    }

    void update() {
        position.x = constrain(position.x, 0, layout[0].length * tileSize); 
        position.y = constrain(position.y, 0, layout.length * tileSize); 
    }


    private void moveX(float speed) {
        position.x += speed;
    }

    private void moveY(float speed) {
        position.y += speed;
    }


    void moveDev() {
        int activeActions = 0;
        float speedMultiplier = 100.0;

        for (String action : keys.actions.keySet()) {
            if (keys.actions.get(action)) {
                activeActions++;
            }
        }

        if (activeActions > 1) {
            speedMultiplier = 100.0 / sqrt(2);
        }

        if (keys.actions.get("MOVE-UP")) moveY(-player.acceleration * speedMultiplier);
        if (keys.actions.get("MOVE-DOWN")) moveY(player.acceleration * speedMultiplier);
        if (keys.actions.get("MOVE-LEFT")) moveX(-player.acceleration * speedMultiplier);
        if (keys.actions.get("MOVE-RIGHT")) moveX(player.acceleration * speedMultiplier);
    }

    void save(String path) {
        String[] lines = new String[layout.length];

        for (int i = 0; i < layout.length; i++) {
            String[] stringRow = new String[layout[i].length];
            for (int j = 0; j < layout[i].length; j++) {
                stringRow[j] = String.valueOf(layout[i][j]);
            }
            lines[i] = join(stringRow, " ");
        }

        try {
            saveStrings(path, lines);
        } catch (Exception e) {
            println("An error occurred: " + e.getMessage());
        }
    }

    void zoom(int amount) {
        if (amount > 0 && tileSize + amount > 2000) return;
        if (amount < 0 && tileSize + amount < 10) return;

        tileSize += amount;
    }
}
