class Player extends Entity {
    Player(float x, float y, float speed, float health, float size) {
        super(x, y, speed, health, size);
    }

    void move() {
        for (String action : actionStates.keySet()) {
            if (actionStates.get(action)) {
                if (action.equals("MOVE-UP")) y -= speed;
                if (action.equals("MOVE-DOWN")) y += speed;
                if (action.equals("MOVE-LEFT")) x -= speed; 
                if (action.equals("MOVE-RIGHT")) x += speed; 
            }
        }
    }

    void update() {

    }
}
