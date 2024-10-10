class Map {
    private PVector position;
    private String path;
    private int[][] layout;
    private float tileSize = 64;

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

                float centeredX = WIDTH / 2 + tileX;
                float centeredY = HEIGHT / 2 + tileY;

                if (tile != null) {
                    image(tile, centeredX, centeredY, tileSize, tileSize);
                }
            }
        } 
    }

    void move() {
        if (keys.actions.get("ACCELERATE")) {
            float dx = cos(player.rotation) * player.speed;
            float dy = sin(player.rotation) * player.speed;
            
            moveX(-dx);
            moveY(-dy);
        }   
    }

    void moveDev() {
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

    private void moveX(float speed) {
        position.x += speed;
    }

    private void moveY(float speed) {
        position.y += speed;
    }

    void update() {
        position.x = constrain(position.x, 0, layout[0].length * tileSize); 
        position.y = constrain(position.y, 0, layout.length * tileSize); 
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
