class Keys {
    String[][] binds = {
        {"w", "ACCELERATE"},
        {"s", "BRAKE"},
        {"a", "TURN-LEFT"},
        {"d", "TURN-RIGHT"},

        {"w", "MAP-UP"},
        {"s", "MAP-DOWN"},
        {"a", "MAP-LEFT"},
        {"d", "MAP-RIGHT"},
        {"z", "ZOOM-OUT"},
        {"x", "ZOOM-IN"},
        {"q", "DRAW-SHEET"},
        {"r", "RELOAD"},

        {"w", "MENU-UP"},
        {"s", "MENU-DOWN"},
        {"e", "MENU-ENTER"},
    };

    HashMap<String, Boolean> actions;

    Keys() {
        this.actions = new HashMap<String, Boolean>();
        setup();
    }

    void setup() {
        for (String[] bind : binds) {
            String action = bind[1];
            actions.put(action, false); 
        }
    }
}

void keyPressed() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (String[] bind : keys.binds) {
        if (bind[0].equals(lower)) {
            String action = bind[1];
            keys.actions.put(action, true);
        }
    }
}

void keyReleased() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (String[] bind : keys.binds) {
        if (bind[0].equals(lower)) {
            String action = bind[1];
            keys.actions.put(action, false);
        }
    }
}
