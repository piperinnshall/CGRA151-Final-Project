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
        fill(255, 0, 0);
        rect(0, 0, size, size / 2);
        popMatrix();

        fill(0, 255, 0);
        PVector[] cornerPositions = corners();
        for (PVector corner : cornerPositions) {
            pushMatrix();
            corner.add(camera);
            translate(corner.x, corner.y);
            rotate(rotation);
            rectMode(CENTER);
            rect(0, 0, 10, 5);
            popMatrix();
        }
    }

    PVector[] corners() {
        PVector[] corners = new PVector[4];

        float width = size;
        float height = size / 2;

        corners[0] = new PVector(-width / 2, -height / 2);
        corners[1] = new PVector(width / 2, -height / 2);
        corners[2] = new PVector(-width / 2, height / 2);
        corners[3] = new PVector(width / 2, height / 2);

        PVector[] rotatedCorners = new PVector[4];
        for (int i = 0; i < corners.length; i++) {
            PVector corner = corners[i].copy();
            corner.rotate(rotation);
            rotatedCorners[i] = corner;
        }

        return rotatedCorners;
    }


    abstract void move();
    abstract void update();
}
