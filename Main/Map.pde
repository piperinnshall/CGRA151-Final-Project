class Map {
    private int[][] map;
    private float x, y;
    private float tileSize = 50;

    void setup(String filename) {
        try {
            String[] lines = loadStrings(filename);
            if (lines == null || lines.length == 0) {
                throw new Exception("File is empty or could not be read: " + filename);
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
        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                if (map[i][j] == 0) fill(128, 128, 128);  // Grey for road
                if (map[i][j] == 1) fill(139, 69, 19);    // Brown for mud or construction area
                if (map[i][j] == 2) fill(0, 255, 0);      // Green for grass or parks
                if (map[i][j] == 3) fill(64, 64, 64);     // Dark grey for buildings
                if (map[i][j] == 4) fill(0, 0, 255);      // Blue for water (lakes, rivers, etc.)
                if (map[i][j] == 5) fill(211, 211, 211);  // Light grey for sidewalks
                if (map[i][j] == 6) fill(222, 184, 135);  // Light brown for residential areas
                if (map[i][j] == 7) fill(101, 67, 33);    // Dark brown for industrial areas
                if (map[i][j] == 8) fill(255, 0, 0);      // Red for traffic lights or markers
                if (map[i][j] == 9) fill(192, 192, 192);  // Silver for metallic structures (bridges, etc.)

                float tileX = j * tileSize - x;
                float tileY = i * tileSize - y;

                 square(WIDTH / 2 + tileX, HEIGHT / 2 + tileY, tileSize);
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

