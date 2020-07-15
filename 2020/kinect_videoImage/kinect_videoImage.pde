import org.openkinect.processing.*;

Kinect kinect;

PImage img;

void setup() {
  size(500, 500, P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
  //Para activar los colores ColorDepth, solo descomentar:
  //kinect.enableColorDepth(true);
  
  //Para utilizar la cámara RGB, descomentar:
  kinect.initVideo();
}

void draw() {
  background(0);
  //Obteniendo Depth Image
  //img = kinect.getDepthImage();
  //image(img, 0, 0);
  
  //Obteniendo video RGB
  img = kinect.getVideoImage();
  image(img, 0, 0);
}
