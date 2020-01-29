import processing.video.*;

Capture video;

void captureEvent(Capture video) {
  video.read();
}

void setup() {
  //size(320, 240);
  fullScreen();
  video = new Capture(this, width, height);
  video.start();
  noStroke();
}

void draw() {
  //image(video, 0, 0);
  for (int i = 0; i < 10000; i++) {
    float x = random(width);
    float y = random(height);
    color c = video.get(int(x), int(y));
    fill(c);
    ellipse(x, y, 15, 15);
  }
}
