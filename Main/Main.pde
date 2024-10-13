int WIDTH = 1900;
int HEIGHT = 1060;
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
