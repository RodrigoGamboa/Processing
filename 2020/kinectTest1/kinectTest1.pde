import org.openkinect.processing.*;

Kinect kinect;

void setup() {
  size(500, 500, P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw() {
  background(0);
  
  PImage img = kinect.getDepthImage();
  //image(img, 0, 0);
  int skip = 5;
  for (int x = 0; x < img.width; x+=skip) {
    for (int y = 0; y < img.height; y+=skip) {
      int loc = x + y * img.width;
      float b = brightness(img.pixels[loc]);
      float z = map(b, 0, 255, 150, -150);
      fill(255-b);
      pushMatrix();
      translate(x, y, z);
      ellipse(0, 0, skip/2, skip/2);
      popMatrix();
    }
  }
}
