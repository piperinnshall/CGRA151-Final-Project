class Map {
    private int[][] map;
    private float x, y;
    private float tileSize = 250;

    void setup(String filename) {
        x = 250;
        y = 250;
        String[] lines = loadStrings(filename);
        map = new int[lines.length][];

        for (int i = 0; i < lines.length; i++) {
            String[] numbers = split(lines[i], ' ');
            map[i] = new int[numbers.length];

            for (int j = 0; j < numbers.length; j++) {
                map[i][j] = Integer.parseInt(numbers[j]);
            }
        }
    }

    void render() {
        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                if (map[i][j] == 0) fill(255, 0, 0);
                if (map[i][j] == 1) fill(0, 255, 0);
                if (map[i][j] == 2) fill(0, 0, 255);

                float tileX = j * tileSize - x;
                float tileY = i * tileSize - y;

                square(WIDTH / 2 + tileX, HEIGHT / 2 + tileY, tileSize);
            }
        } 
    }

    void move() {
        for (String action : keys.actions.keySet()) {
            if (keys.actions.get(action)) {
                if (action.equals("MOVE-UP")) moveY(-player.speed);
                if (action.equals("MOVE-DOWN")) moveY(player.speed);
                if (action.equals("MOVE-LEFT")) moveX(-player.speed);
                if (action.equals("MOVE-RIGHT")) moveX(player.speed);
            }
        }
    }

    void update() {
        x = constrain(x, 0, map.length * tileSize); 
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

