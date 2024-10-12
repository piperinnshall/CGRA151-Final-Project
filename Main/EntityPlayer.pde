class Player extends Entity {

    Player(float rotation, float acceleration, float deceleration, float health, float size, float maxSpeed, float maxReverse, float rotationSpeed) {
        super(rotation, acceleration, deceleration, health, size, maxSpeed, maxReverse, rotationSpeed);
    }

    void move() {
        if (keys.actions.get("ACCELERATE")) {
            currentSpeed += acceleration;
            currentSpeed = constrain(currentSpeed, 0, maxSpeed);
        } 
        else if (keys.actions.get("DECELERATE")) {
            currentSpeed -= deceleration;
            currentSpeed = constrain(currentSpeed, -maxReverse, maxSpeed);
        } 
        else {
            currentSpeed *= 0.95;
        }

        if (keys.actions.get("TURN-LEFT")) {
            rotation -= rotationSpeed;
        }

        if (keys.actions.get("TURN-RIGHT")) {
            rotation += rotationSpeed;
        }

        float dx = cos(rotation) * currentSpeed;
        float dy = sin(rotation) * currentSpeed;

        position.x += dx;
        position.y += dy;
    }

    void update() {
        float marginX = WIDTH / 3;
        float marginY = HEIGHT / 3;

        position.x = constrain(position.x, marginX, WIDTH - marginX);
        position.y = constrain(position.y, marginY, HEIGHT - marginY);
    }
}
