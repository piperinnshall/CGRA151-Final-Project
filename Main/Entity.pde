abstract class Entity {
    float rotation;
    float acceleration; 
    float deceleration;
    float health;
    float size;
    float maxSpeed;
    float maxReverse;
    float rotationSpeed;
    float currentSpeed;
    PVector camera;

    Entity(float rotation, float acceleration, float deceleration, float health, float size, float maxSpeed, float maxReverse, float rotationSpeed, PVector camera) {
        this.rotation = rotation;
        this.acceleration = acceleration;
        this.deceleration = deceleration;
        this.health = health;
        this.size = size;
        this.maxSpeed = maxSpeed;
        this.maxReverse = maxReverse;
        this.rotationSpeed = rotationSpeed;
        this.camera = camera;
        this.setup();
    }

    void setup() {
        this.currentSpeed = 0;
    }

    void render() {
        pushMatrix();
        translate(camera.x, camera.y);
        rotate(rotation);
        rectMode(CENTER);
        rect(0, 0, size, size / 2);
        popMatrix();
    }

    abstract void move();
    abstract void update();
}
