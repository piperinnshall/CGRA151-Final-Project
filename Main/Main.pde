State state;
Game game;

void settings() {
    size(1920, 1080);
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
