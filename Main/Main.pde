int WIDTH = 1420;
int HEIGHT = 800;
Game game;

void settings() {
    size(WIDTH, HEIGHT);
    noSmooth();
}

void setup() {
    game = new Game();
}

void draw() {
    background(0);
    //game.run();
    game.dev();
}
