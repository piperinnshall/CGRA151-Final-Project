int WIDTH = 1920;
int HEIGHT = 1080;

void settings() {
    size(WIDTH, HEIGHT);
    noSmooth();
}

void setup() {
    setupGame();
}

void draw() {
    background(0);

    map.render();
    map.move();
    map.update();

    for (Entity entity : entities) {
        entity.render();
        entity.move();
        entity.update();
    }

    debug();
}
