import processing.video.*;

int x1, y1, w1, h1, x2, y2, w2, h2;
int jitter = 0;
Capture video;

void captureEvent(Capture video) {
  video.read();
}

void setup() {
  size(320, 240);
  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  //image(video, 0, 0);
  for (int i = 0; i < 500; i++) {
    x1 = int(random(video.width));
    y1 = int(random(video.height));
    w1 = int(random(-jitter, jitter));
    h1 = int(random(-jitter, jitter));
    x2 = x1 + int(random(-jitter, jitter));
    y2 = y1 + int(random(-jitter, jitter));
    w2 = w1;
    h2 = h1;
    copy(video, x1, y1, w1, h1, x2, y2, w2, h2);
  }
  fill(0, 10);
  rect(0, 0, width, height);
}

void mousePressed() {
  jitter = 30;
}
