class Menu {
    String[] paths;
    PFont[] fonts;
    String[] menuItems;
    int index;
    int interval;
    boolean pressedUp;
    boolean pressedDown;
    boolean pressedEnter;

    Menu(String[] paths) {
        this.paths = paths;
        setup();
    }

    void setup() {
        fonts = new PFont[paths.length];
        interval = 30;

        for (int i = 0; i < paths.length; i++) {
            fonts[i] = createFont(paths[i], 128);
        }
    }

    void header(String[] header) {
        textAlign(LEFT);

        float fontRef = 64;
        float heightRef = 1080;
        float fontSize = fontRef / heightRef * height;

        fill(255);
        textFont(fonts[0]);
        textSize(fontSize);
        text(header[0] + header[1], (width - textWidth(header[0] + header[1])) / 2, height / 3);
        text(header[2] + header[3] + header[4], (width - textWidth(header[2] + header[3] + header[4])) / 2, height / 3 + fontSize * 1.5);
    }

    void items(String[] items, float startY) {
        this.menuItems = items;

        textAlign(LEFT);
        fill(255);

        float fontRef = 32;
        float heightRef = 1080;

        for (int i = 0; i < menuItems.length; i++) {
            if (index == i) {
                textFont(fonts[3]);
            } else {
                textFont(fonts[2]);
            }
            textSize(fontRef / heightRef * height);
            text(menuItems[i], (width - textWidth(menuItems[i])) / 2, startY + i * 50);
        }
    }

    void update() {
        if (keys.actions.get("menu up")) {
            if (!pressedUp) {
                pressedUp = true;
                index = (index - 1 + menuItems.length) % menuItems.length;
            }
        } else {
            pressedUp = false;
        }

        if (keys.actions.get("menu down")) {
            if (!pressedDown) {
                pressedDown = true;
                index = (index + 1) % menuItems.length;
            }
        } else {
            pressedDown = false;
        }

        if (keys.actions.get("menu enter")) {
            if (!pressedEnter){
                pressedEnter = true;
                switch (menuItems[index]) {
                    case "PLAY":
                        state.state = GameState.PLAY;
                        break;
                    case "MAPS":
                        state.state = GameState.MAPS;
                        break;
                    case "SETTINGS":
                        state.state = GameState.SETTINGS;
                        break;
                    case "KEYS":
                        state.state = GameState.KEYS;
                        break;
                    case "SCORE":
                        state.state = GameState.SCORE;
                        break;
                    case "BACK":
                        state.state = GameState.MENU;
                        break;
                    case "1920 x 1080    16:9":
                        windowResize(1920, 1080);
                        break;
                    case "1920 x 1024    16:10":
                        windowResize(1920, 1024);
                        break;
                    case "1440 x 1080    4:3":
                        windowResize(1440, 1080);
                        break;
                    case "1680 x 1050    16:10":
                        windowResize(1680, 1050);
                        break;
                    case "EDIT MAP 1":
                        game.loadGame(map1);
                        state.state = GameState.EDITING;
                        break;
                    case "EDIT MAP 2":
                        game.loadGame(map2);
                        state.state = GameState.EDITING;
                        break;
                    case "PLAY MAP 1":
                        game.loadGame(map1);
                        state.state = GameState.PLAYING;
                        break;
                    case "PLAY MAP 2":
                        game.loadGame(map2);
                        state.state = GameState.PLAYING;
                        break;
                }
            }
        } else {
            pressedEnter = false;
        }
    }
}
