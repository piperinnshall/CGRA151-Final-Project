class Player extends Entity {

    PVector center = new PVector(WIDTH / 2, HEIGHT / 2);
    PVector margin = new PVector();
    PVector marginTarget = new PVector();
    PVector marginSmall = new PVector(WIDTH / 5, HEIGHT / 3.5);
    PVector marginLarge = new PVector(WIDTH / 3, HEIGHT / 2.5);

    Player(float rotation, float acceleration, float deceleration, float health, float size, float maxSpeed, float maxReverse, float rotationSpeed, PVector camera) {
        super(rotation, acceleration, deceleration, health, size, maxSpeed, maxReverse, rotationSpeed, camera);
    }

    void move() {
        if (keys.actions.get("ACCELERATE") && keys.actions.get("BRAKE")) {
            currentSpeed = constrain(currentSpeed, maxSpeed / 3, maxSpeed);
        }

        if (!keys.actions.get("ACCELERATE") && !keys.actions.get("BRAKE")) {
            currentSpeed *= currentSpeed < 1 ? 0 : 0.995;
        }

        if (keys.actions.get("ACCELERATE")) {
            currentSpeed += acceleration;
        }

        if (keys.actions.get("BRAKE")) {
            currentSpeed -= currentSpeed > 0 ? deceleration : acceleration;
        }

        if (keys.actions.get("TURN-LEFT")) {
            rotation -= (currentSpeed / maxSpeed) * rotationSpeed;
        }

        if (keys.actions.get("TURN-RIGHT")) {
            rotation += (currentSpeed / maxSpeed) * rotationSpeed;
        }
    }

    void update() {
        currentSpeed = constrain(currentSpeed, -maxReverse, maxSpeed);

        camera.lerp(center, constrain(map(camera.dist(center), 0, 200, 0.2, 0.1), 0.1, 0.2));

        margin.lerp(keys.actions.get("ACCELERATE") || keys.actions.get("BRAKE") ? marginSmall : marginLarge, 0.15);

        camera.add(new PVector(player.currentSpeed * 1.5 * cos(player.rotation), player.currentSpeed * 1.5 * sin(player.rotation)));

        camera.set(constrain(camera.x, margin.x, WIDTH - margin.x), constrain(camera.y, margin.y, HEIGHT - margin.y));
    }
}
