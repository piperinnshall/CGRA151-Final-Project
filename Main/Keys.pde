String[][] keyBindings = {
    {"w", "MOVE-UP"},
    {"a", "MOVE-LEFT"},
    {"s", "MOVE-DOWN"},
    {"d", "MOVE-RIGHT"}
};

HashMap<String, Boolean> actionStates = new HashMap<String, Boolean>();

void setupKey() {
    for (int i = 0; i < keyBindings.length; i++) {
        String action = keyBindings[i][1];
        actionStates.put(action, false);
    }
}

void keyPressed() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keyBindings.length; i++) {
        if (keyBindings[i][0].equals(lower)) {
            String action = keyBindings[i][1];
            actionStates.put(action, true);
        }
    }
}

void keyReleased() {
    String lower = Character.toString(Character.toLowerCase(key));

    for (int i = 0; i < keyBindings.length; i++) {
        if (keyBindings[i][0].equals(lower)) {
            String action = keyBindings[i][1];
            actionStates.put(action, false);
        }
    }
}
