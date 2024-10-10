class Parallax {
    PImage[] layers = new PImage[6];
    float[] speed = new float[6];
    float offset = 0;
    float scrollSpeed = 0.5;

    Parallax(String[] paths) {
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
