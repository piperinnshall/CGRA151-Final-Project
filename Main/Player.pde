class Player extends Entity {

    PVector center = new PVector(width / 2, height / 2);
    PVector margin = new PVector();
    PVector marginTarget = new PVector();
    PVector marginSmall = new PVector(width / 5, height / 3.5);
    PVector marginLarge = new PVector(width / 3, height / 2.5);

    Player(float rotation, float acceleration, float deceleration, float health, float size, float maxSpeed, float maxReverse, float rotationSpeed, PVector camera) {
        super(rotation, acceleration, deceleration, health, size, maxSpeed, maxReverse, rotationSpeed, camera);
    }

    void move() {
        if (keys.actions.get("accelerate") && keys.actions.get("brake")) {
            currentSpeed = constrain(currentSpeed, maxSpeed / 3, maxSpeed);
        }

        if (!keys.actions.get("accelerate") && !keys.actions.get("brake")) {
            currentSpeed *= (currentSpeed > -1 && currentSpeed < 1) ? 0 : 0.995;
        }

        if (keys.actions.get("accelerate")) {
            currentSpeed += acceleration;
        }

        if (keys.actions.get("brake")) {
            currentSpeed -= currentSpeed > 0 ? deceleration : acceleration;
        }

        if (keys.actions.get("turn left")) {
            rotation -= (currentSpeed / maxSpeed) * rotationSpeed;
        }

        if (keys.actions.get("turn right")) {
            rotation += (currentSpeed / maxSpeed) * rotationSpeed;
        }
    }

    void update() {
        if (health <= 0 && state.state == GameState.PLAYING) {
            score.setup();
            score.save();
            state.state = GameState.OVER;
        }

        currentSpeed = constrain(currentSpeed, -maxReverse, maxSpeed);

        camera.lerp(center, constrain(map(camera.dist(center), 0, 200, 0.2, 0.1), 0.1, 0.2));

        margin.lerp(keys.actions.get("accelerate") || keys.actions.get("brake") ? marginSmall : marginLarge, 0.15);

        camera.add(new PVector(player.currentSpeed * 1.5 * cos(player.rotation), player.currentSpeed * 1.5 * sin(player.rotation)));

        camera.set(constrain(camera.x, margin.x, width - margin.x), constrain(camera.y, margin.y, height - margin.y));
    }
}
