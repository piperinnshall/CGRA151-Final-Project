abstract class Entity {
    PVector position;
    float rotation;
    float size;
    float speed;
    float health;

    Entity(float rotation, float speed, float health, float size) {
        this.rotation = rotation;
        this.speed = speed;
        this.health = health;
        this.size = size;
        setup();
    }

    void setup() {
        position = new PVector(WIDTH / 2, HEIGHT / 2);
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
