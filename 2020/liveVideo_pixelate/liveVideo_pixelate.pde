import processing.video.*;

Capture video;
PImage videoCut;

int numTilesW = 1; 
int numTilesH = 1;
int tileW, tileH = 0;;

void setup() {
  size(640, 360);
  video = new Capture(this, 640, 360);
  video.start();
  noFill();
  noStroke();
}

void draw() {
  background(0);
  video.loadPixels();
  numTilesW = (mouseX/2)+1;
  numTilesH = (mouseY/2)+1;
  tileW = width/numTilesW;
  tileH = height/numTilesH;
  for (int x = 0; x < numTilesW+1; x++) {
    for (int y = 0; y < numTilesH+1; y++) {      
      //point(x*tileW+tileW/2, y*tileH+tileH/2);
      color c = video.get(x*tileW+tileW/2, y*tileH+tileH/2);
      fill(c);
      //ellipse(x*tileW, y*tileH, tileW/2, tileH/2);
      rect(x*tileW, y*tileH, tileW, tileH);
    }
  }
  video.updatePixels();
}

void captureEvent(Capture Event) {
  video.read();
}
