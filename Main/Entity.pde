abstract class Entity {
    float rotation;
    float acceleration, deceleration;
    float health;
    float size;
    float maxSpeed;
    float maxReverse;
    float rotationSpeed;
    float currentSpeed;
    PVector position;

    Entity(float rotation, float acceleration, float deceleration, float health, float size, float maxSpeed, float maxReverse, float rotationSpeed) {
        this.rotation = rotation;
        this.acceleration = acceleration;
        this.deceleration = deceleration;
        this.health = health;
        this.size = size;
        this.maxSpeed = maxSpeed;
        this.maxReverse = maxReverse;
        this.rotationSpeed = rotationSpeed;
        this.setup();
    }

    void setup() {
        this.currentSpeed = 0;
        this.position = new PVector(WIDTH / 2, HEIGHT / 2);
    }

    void render() {
        pushMatrix();
        translate(position.x, position.y);
        rotate(rotation);
        rectMode(CENTER);
        rect(0, 0, size, size / 2);
        popMatrix();
    }

    abstract void move();
    abstract void update();
}
