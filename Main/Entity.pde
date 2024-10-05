abstract class Entity {
    float x, y;
    float size;
    float speed;
    float health;

    Entity(float x, float y, float speed, float health, float size) {
        this.x = x;
        this.y = y;
        this.speed = speed;
        this.health = health;
        this.size = size;
    }

    boolean collides(Entity other) {
        float distance = dist(x, y, other.x, other.y);
        return distance < (this.size / 2 + other.size / 2);
    }

    void render() {
        ellipseMode(CENTER);
        fill(100);
        circle(this.x, this.y, this.size);
    }

    abstract void move();
    abstract void update();
}
