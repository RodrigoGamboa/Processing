//Ref: https://www.youtube.com/watch?v=QLHMtE5XsMs

import processing.video.*;

Capture video;
PImage prev;

color trackColor;
float threshold = 25; 


void setup() {
  size(480, 320);
  video = new Capture(this, width, height);
  video.start();
  prev = createImage(480, 320, RGB);
  trackColor = color(255, 0, 0);
}

void captureEvent(Capture Event) {
  prev.copy(video, 0, 0, video.width, video.height, 0, 0, prev.width, prev.height);
  prev.updatePixels();
  video.read();
}

void draw() {
  video.loadPixels();
  prev.loadPixels();
  image(video, 0, 0);

  float avgX = 0;
  float avgY = 0;

  int count = 0;

  loadPixels();

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      color prevColor = prev.pixels[loc];
      float r2 = red(prevColor);
      float g2 = green(prevColor);
      float b2 = blue(prevColor);

      float d  = distSq(r1, g1, b1, r2, g2, b2);

      if (d < threshold*threshold) {
        //avgX += x;
        //avgY += y;
        //count++;
        pixels[loc] = color(0);
      } else {
        pixels[loc] = color(255);
      }
    }
  }
  updatePixels();


  if (count > 0) {
    avgX = avgX / count;
    avgY = avgY / count;
    fill(trackColor);
    stroke(0);
    ellipse(avgX, avgY, 16, 16);
    println(avgX + ", " + avgY);
  }
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
  return d;
}
