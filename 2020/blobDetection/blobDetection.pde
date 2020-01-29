//float diff = dist(r1, g1, b1, r2, g2, b2);

import processing.video.*;

Capture video;

color trackColor;
float threshold = 25; 
float distThreshold = 25;

ArrayList<Blob> blobs = new ArrayList<Blob>();  //Flexible size array

void setup() {
  size(480, 320);
  video = new Capture(this, width, height);
  video.start();
  trackColor = color(255, 0, 0);
}

void captureEvent(Capture Event) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);

  blobs.clear();  //?

  threshold = 80;


  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      float d  = distSq(r1, g1, b1, r2, g2, b2);

      if (d < threshold*threshold) {

        boolean found = false;
        for (Blob b : blobs) {
          if (b.isNear(x, y)) {
            b.add(x, y);
            found = true;
            break;
          }
        }
        if (!found) {
          Blob b = new Blob(x, y);
          blobs.add(b);
        }
      }
    }
  }
  
  for(Blob b : blobs) {
    b.show();
  }
  
}

float distSq(float x1, float y1, float x2, float y2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1);
  return d;
}

float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
  float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
  return d;
}
