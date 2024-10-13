String[] paths;
PFont[] fonts;
String[] buttons;
int index;
int interval;

class Menu {
    String[] paths;
    PFont[] fonts;

    Menu(String[] paths) {
        this.paths = paths;
        setup();
    }

    void setup() {
        fonts = new PFont[paths.length];
        buttons = new String[]{"PLAY", "MAPS", "SETTINGS"};
        index = 0;
        interval = 30;

        for (int i = 0; i < paths.length; i++) {
            fonts[i] = createFont(paths[i], 128);
        }
    }

    void render() {
        fill(255);
        textFont(fonts[0]);
        textSize(64);
        String name = "Your Game Name";
        text(name, (width - textWidth(name)) / 2, height / 8);

        for (int i = 0; i < buttons.length; i++) {
            if (index == i) {
                textFont(fonts[3]);
            } else {
                textFont(fonts[2]);
            }
            textSize(32);
            text(buttons[i], (width - textWidth(buttons[i])) / 2, height / 2 + i * 50);
        }
    }

    boolean pressedUp = false;
    boolean pressedDown = false;

    void update() {
        if (keys.actions.get("MENU-UP")) {
            if (!pressedUp) {
                pressedUp = true;
                index = (index - 1 + buttons.length) % buttons.length;
            }
        } else {
            pressedUp = false;
        }

        if (keys.actions.get("MENU-DOWN")) {
            if (!pressedDown) {
                pressedDown = true;
                index = (index + 1) % buttons.length;
            }
        } else {
            pressedDown = false;
        }

        if (keys.actions.get("MENU-ENTER")) {
            switch (buttons[index]) {
                case "PLAY":
                    state.state = GameState.PLAY;
                    break;
                case "MAPS":
                    state.state = GameState.MAPS;
                    break;
                case "SETTINGS":
                    state.state = GameState.SETTINGS;
                    break;
            }
        }
    }
}
