int WIDTH = 1900;
int HEIGHT = 1060;
State state;
Game game;

void settings() {
    size(WIDTH, HEIGHT);
    noSmooth();
}

void setup() {
    game = new Game();
    state = new State();
}

void draw() {
    background(0);
    state.run();
}
