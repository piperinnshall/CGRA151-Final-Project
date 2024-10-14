class Keys {
    String[][] binds = {
        {"w", "accelerate"},
        {"s", "brake"},
        {"a", "turn left"},
        {"d", "turn right"},

        {"w", "map up"},
        {"s", "map down"},
        {"a", "map left"},
        {"d", "map right"},
        {"z", "zoom out"},
        {"x", "zoom in"},
        {"q", "draw sheet"},
        {"r", "reload"},

        {"w", "menu up"},
        {"s", "menu down"},
        {"e", "menu enter"},
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
