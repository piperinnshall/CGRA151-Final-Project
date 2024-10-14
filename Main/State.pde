enum GameState {
    MENU,
    SETTINGS,
    MAPS,
    EDIT,
    KEYS,
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
                settings();
                break;
            case MAPS:
                maps();
                break;
            case EDIT:
                edit();
                break;
            case KEYS:
                keys();
                break;
            case PLAY:
                playing();
                break;
            case OVER:
                break;
        }
    }

    void menu() {
        String[] items = {"PLAY", "KEYS", "SETTINGS", "MAPS"};
        parallax.render();
        parallax.update();
        menu.header("GAME NAME");
        menu.render(items, height / 2);
        menu.update();
    }

    void settings() {
        String[] items = {"1920 x 1080    16:9", "1920 x 1024    16:10", "1680 x 1050    16:10", "1440 x 1080    4:3", "BACK"};

        parallax.render();
        parallax.update();
        menu.render(items, height / 2);
        menu.update();
    }

    void maps() {
        String[] items = {"EDIT MAP 1", "EDIT MAP 2", "BACK"};

        parallax.render();
        parallax.update();
        menu.render(items, height / 2);
        menu.update();
    }

    void keys() {
        String[] items = new String[keys.binds.length + 1]; 

        for (int i = 0; i < keys.binds.length; i++) {
            items [i] = keys.binds[i][0] + ": " + keys.binds[i][1].toUpperCase();
        }

        items[items.length - 1] = "BACK";

        parallax.render();
        parallax.update();
        menu.render(items, height / 8);
        menu.update();
    }

    void editing() {
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
