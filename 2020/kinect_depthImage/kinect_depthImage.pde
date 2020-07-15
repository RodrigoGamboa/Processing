import org.openkinect.processing.*;

Kinect kinect;

PImage img;

void setup() {
  size(500, 500, P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw() {
  background(0);
  //Obteniendo Depth Image
  img = kinect.getDepthImage();
  image(img, 0, 0);
}
