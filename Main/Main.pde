int WIDTH = 700;
int HEIGHT = 700;

void settings() {
    size(WIDTH, HEIGHT);
}

void setup() {
    background(255);
    setupKey();
    setupGame();
}

void draw() {
    int[][] test = Map.get();
    for (Entity entity : entities) {
        entity.render();
        entity.move();
    }
}
