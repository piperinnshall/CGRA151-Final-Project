int WIDTH = 700;
int HEIGHT = 700;

void settings() {
    size(WIDTH, HEIGHT);
}

void setup() {
    setupGame();
}

void draw() {
    background(255);

    debug();

    map.render();
    map.move();
    map.update();

    for (Entity entity : entities) {
        entity.render();
        entity.move();
        entity.update();
    }
}
