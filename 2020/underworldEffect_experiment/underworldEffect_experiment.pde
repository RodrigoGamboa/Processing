import processing.video.*;

Capture video;
int timeTracker = 0;
float timeInterval = 1; 
int x = 0;
int index = 0;
PImage[] frames;
int frame_count = 10;

void captureEvent(Capture video) {
  video.read();
  PImage p = video;
  if (millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    frames[index] = p.copy();
  }
  index += 1;
  if (index == frame_count) {
    index = 0;
  }
}

void setup() {
  size(480, 360);
  timeTracker = millis();
  video = new Capture(this, 320, 240);
  video.start();
  frames = new PImage[frame_count];
  for (int i = 0; i < frame_count; i++) {
    frames[i] = createImage(0, 0, 0);
  }
}

void draw() {
  showVideo();
}

void showVideo() {
  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      for (int i = 0; i < frame_count; i++) {
        image(frames[(index+i)%frame_count], 160*x, 120*y, 160, 120);
        noFill();
        stroke(255, 1, 154);
        //rect(160*x, 120*y, 160, 120);
      }
    }
  }
  noFill();
  stroke(255, 1, 154);
  for (int i = 0; i < 10; i++) {
    //rect(random(width), random(height), random(10, 100), random(10, 100));
  }
}
