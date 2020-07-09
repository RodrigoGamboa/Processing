import processing.video.*;
Movie video;

int degrees = 360;
int centerX1, centerY1, centerX2, centerY2;
float circumferenceX, circumferenceY;
int radius;
int ran = 5;
float noiseFactor;
PImage img;

void setup() {
  size(850, 500, P3D);
  video = new Movie(this, "halitrephes.mp4");  
  video.loop();
  video.jump(25);
  video.volume(0);
  //video.resize(500, 500);
  noFill();
  noStroke();
  background(0);
}

void draw() {
  background(255);
 
  centerX1 = mouseX;
  centerY1 = mouseY;
  centerX2 = mouseY;
  centerY2 = mouseX;
  radius = height/2;
  ran = mouseX/10;

  beginShape();
  texture(video);
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.02, float(frameCount)/150);
    circumferenceX = centerX1 + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY1 + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY, circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  beginShape();
  texture(video);
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.01, float(frameCount)/150);
    circumferenceX = centerX2 + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY2 + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY, circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
}

void movieEvent(Movie m) {
  m.read();
}
