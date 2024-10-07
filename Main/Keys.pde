class Keys {
    String[][] maps = {
        {"w", "MOVE-UP"},
        {"a", "MOVE-LEFT"},
        {"s", "MOVE-DOWN"},
        {"d", "MOVE-RIGHT"}
    };

    HashMap<String, Boolean> actions;

    Keys() {
        this.actions = new HashMap<String, Boolean>();
        setup();
    }

    void setup() {
        for (int i = 0; i < maps.length; i++) {
            String action = maps[i][1];
            actions.put(action, false);
        }
    }
}

void keyPressed() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keys.maps.length; i++) {
        if (keys.maps[i][0].equals(lower)) {
            String action = keys.maps[i][1];
            keys.actions.put(action, true);
        }
    }
}

void keyReleased() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keys.maps.length; i++) {
        if (keys.maps[i][0].equals(lower)) {
            String action = keys.maps[i][1];
            keys.actions.put(action, false);
        }
    }
}
