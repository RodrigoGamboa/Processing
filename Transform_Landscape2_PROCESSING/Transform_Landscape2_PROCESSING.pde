/**
 * Transform: Transcoded Landscape
 * from Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 * 
 * This code was written for Processing 1.2+
 * Get Processing at http://www.processing.org/download
 */
 
 
import processing.opengl.*;

PImage img;
int[][] values;
float angle;

void setup() {
  fullScreen(OPENGL, SPAN);
  //size(1024, 1024, OPENGL);
  noFill();
  
  values = new int[width][height];

  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("FABACADEMY2019.jpg");
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color pixel = img.pixels[i*img.width + j];
      values[j][i] = int(brightness(pixel));
    }
  }
}

void draw() {
  
  background(0);                     // Set black background
  translate(width/2, height/2, 0);   // Move to the center
  scale(1.0);                        // Scale to 400%
  
  // Update the angle
  angle += 0.005;
  rotateY(angle);  
  
  // Display the image mass
  for (int i = 0; i < img.height; i += 4) {
    for (int j = 0; j < img.width; j += 4) {
      stroke(values[j][i], 127, 127, 255);
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = -values[j][i]/2;
      float x2 = j-img.width/2;
      float y2 = i-img.height/2;
      float z2 = -values[j][i]/2-1;
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}
