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
int[][] values, value_r, value_g, value_b;
float angle;

void setup() {
  fullScreen(OPENGL, SPAN);
  //size(1024, 1024, OPENGL);
  noFill();
  
  values = new int[width][height];

  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("ddm.jpg");
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color pixel = img.pixels[i*img.width + j];      
      values[j][i] = int(brightness(pixel));
      println(pixel);
      //value_r[j][i] = int(red(pixel));
      //value_g[j][i] = int(green(pixel));
      //value_b[j][i] = int(blue(pixel));
    }
  }
  //background(0);
}

void draw() 
{  
  //if(mouseX > width/2)
  {
    background(0);
  }
  translate(width/2, height/2, 0);   // Move to the center. width/2, height/2
  scale(2);                        // Scale to 400%
  
  // Update the angle
  angle += 0.005; //0.005
  rotateY(angle);  
  
  // Display the image mass
  for (int i = 0; i < img.height; i += 2) {
    for (int j = 0; j < img.width; j += 2) {
      stroke(values[j][i], 153);
      //stroke(value_r[j][i], value_g[j][i], value_b[j][i], 153);
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = -values[j][i]/2;
      float x2 = j-img.width/2;
      float y2 = i-img.height/2;
      float z2 = -values[j][i]/2-4;
      line(x1, y1, z1, x2, y2, z2);
      //ellipse(x1, y1, z1, x2);
      //point(x1, y1, z1);
      //line(0, 0, 0, x1, y1, z1);
    }
  }  
}
