import org.openkinect.processing.*;

Kinect kinect;

PImage img;
PImage rgbImage;
PImage depthImage;
int minDepth = 60;
int maxDepth = 860;
int x;

color colorA = color(204, 102, 0);
color colorB = color(0, 102, 153);

void setup() {
  size(500, 500, P3D);
  //fullScreen();
  imageMode(CENTER);
  kinect = new Kinect(this);
  kinect.initDepth();
  // Para activar los colores ColorDepth, solo descomentar:
  //kinect.enableColorDepth(true);
  
  // Para utilizar la cámara RGB, descomentar:
  kinect.initVideo();
  
  // Creando una imagen vacía de las dimensiones del kinect.
  depthImage = new PImage(kinect.width, kinect.height);
}

void draw() {
  background(255);
  
  // Obteniendo Depth Image
  //img = kinect.getDepthImage();
  //image(img, 0, 0);
  
  // Obteniendo video RGB
  rgbImage = kinect.getVideoImage();
  //image(img, 0, 0);
  
  // Threshold del depthImage
  //Primero se obtiene el rawDepth Image: //Ref: https://shiffman.net/p5/kinect/
  int[] rawDepth = kinect.getRawDepth();
  for (int i = 0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      //color interA = lerpColor(colorA, colorB, map(i, 0, rawDepth.length, 0, 255));
      depthImage.pixels[i] = color(map(i, 0, rawDepth.length, 0, 255), map(i, 0, rawDepth.length, 0, abs(map(sin(255), -255, 255, 0, 255))), map(i, 0, rawDepth.length, 0, x));
    } else { 
      depthImage.pixels[i] = color(255-x, map(i, 0, rawDepth.length, 0, 255), 127); 
    }
  }
  x++;
  if(x > 255) x = 0;
  depthImage.updatePixels();
  
  image(depthImage, width/2, height/2);
}
