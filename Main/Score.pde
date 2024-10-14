class Score {
    String path;
    String score;
    int currentScore;
    int lastUpdateTime;

    Score(String path) {
        this.path = path;
        setup();
    }

    void setup() {
        currentScore = 0;

        try {
            String[] lines = loadStrings("Score/" + path + ".txt");

            if (lines == null || lines.length == 0) {
                throw new Exception("File could not be read: " + path);
            }

            score = lines[0];
        } catch (Exception e) {
            println("An error occurred: " + e.getMessage());
        }
    }

    void update() {
        if (millis() - lastUpdateTime >= 1000) {
            currentScore += 1;
            lastUpdateTime = millis();
        }

        fill(255);
        textSize(32);
        text("Score: " + currentScore + " Health: " + player.health, 10, 50);
    }

    void save() {
        try {
            int previousScore = Integer.parseInt(score);

            if (currentScore > previousScore) {
                String[] lines = {String.valueOf(currentScore)};
                saveStrings("Score/" + path + ".txt", lines);
                println("Score saved: " + currentScore);
            } else {
                println("Current score is not greater than the previous score. Not saved.");
            }
        } catch (NumberFormatException e) {
            println("Error converting score to integer: " + e.getMessage());
        } catch (Exception e) {
            println("An error occurred while saving: " + e.getMessage());
        }
    }
}
