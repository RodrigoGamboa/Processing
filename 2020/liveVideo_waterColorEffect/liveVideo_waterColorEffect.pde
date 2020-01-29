import processing.video.*;

Capture video;

int randomX, randomY = 0;

void setup() {
  size(480, 360);
  video = new Capture(this, width, height);
  video.start();
  noStroke();
}

void captureEvent(Capture Event) {
  video.read();
}

void draw() {
  display();
}

void display() {
  

  for (int i = 0; i < 1000; i++) {
    randomX = int(random(width));
    randomY = int(random(height));
    color c = video.get(randomX, randomY);
    fill(c);
    ellipse(randomX, randomY, 20, 20);
  }
}
