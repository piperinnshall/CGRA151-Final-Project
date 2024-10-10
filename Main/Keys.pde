class Keys {
    String[][] binds = {
        {"i", "MOVE-UP"},
        {"j", "MOVE-LEFT"},
        {"k", "MOVE-DOWN"},
        {"l", "MOVE-RIGHT"},
        {"q", "DRAW-SHEET"},
        {"o", "ZOOM-OUT"},
        {"u", "ZOOM-IN"},
        {"w", "ACCELERATE"},
        {"a", "TURN-LEFT"},
        {"d", "TURN-RIGHT"},
    };

    HashMap<String, Boolean> actions;

    Keys() {
        this.actions = new HashMap<String, Boolean>();
        setup();
    }

    void setup() {
        for (int i = 0; i < binds.length; i++) {
            String action = binds[i][1];
            actions.put(action, false);
        }
    }
}

void keyPressed() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keys.binds.length; i++) {
        if (keys.binds[i][0].equals(lower)) {
            String action = keys.binds[i][1];
            keys.actions.put(action, true);
        }
    }
}

void keyReleased() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keys.binds.length; i++) {
        if (keys.binds[i][0].equals(lower)) {
            String action = keys.binds[i][1];
            keys.actions.put(action, false);
        }
    }
}
