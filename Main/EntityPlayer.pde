class Player extends Entity {
    Player(float rotation, float speed, float health, float size) {
        super(rotation, speed, health, size);
    }

    void move() {
        if (keys.actions.get("TURN-LEFT")) {
            rotation -= 0.05;
        }

        if (keys.actions.get("TURN-RIGHT")) {
            rotation += 0.05;
        }
    }

    void update() {
    }
}
