enum GameState {
    MENU,
    SETTINGS,
    MAPS,
    PLAY,
    OVER,
}

class State {
    GameState state;

    State() {
        setup();
    }

    void setup() {
        state = GameState.MENU; 
    }

    void run() {
        switch (state) {
            case MENU:
                menu();
                break;
            case SETTINGS:
                break;
            case MAPS:
                maps();
                break;
            case PLAY:
                playing();
                break;
            case OVER:
                break;
        }
    }

    void menu() {
        parallax.render();
        parallax.update();
        menu.render();
        menu.update();
    }

    void maps() {
        map.render();
        map.move(20);
        map.update();
    }

    void playing() {
        map.render();
        map.move();
        map.update();

        for (Entity entity : entities) {
            entity.render();
            entity.move();
            entity.update();
        }
    }
}
