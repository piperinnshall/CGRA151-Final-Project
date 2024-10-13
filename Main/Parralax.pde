class Parallax {
    String[] paths;
    PImage[] layers;
    float[] speed;
    float offset;
    float scrollSpeed;

    Parallax(String[] paths) {
        this.paths = paths;
        setup();
    }

    void setup() {
        layers = new PImage[paths.length];
        speed = new float[paths.length];
        offset = 0;
        scrollSpeed = 0.5;

        for (int i = 0; i < layers.length; i++) {
            layers[i] = loadImage(paths[i]);
            speed[i] = map(i, 0, layers.length - 1, 0.1, 1.0);
        }
    }

    void update() {
        offset += scrollSpeed;
    }

    void render() {
        for (int i = 0; i < layers.length; i++) {
            float parallaxX = offset * speed[i];
            image(layers[i], -parallaxX % width, 0, width, height);
            image(layers[i], -parallaxX % width + width, 0, width, height);
        }
    }
}

