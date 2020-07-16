import processing.video.*;
Movie video;

int degrees = 360;
int centerX, centerY;
float circumferenceX, circumferenceY;
float radius, radiusPaper;
int ran = 5;
float noiseFactor;
PImage img, back;

void setup() {
  size(480, 360, P2D);
  video = new Movie(this, "yeahright.mp4");  
  video.loop();
  video.jump(55);
  video.volume(0);
  img = loadImage("background.png");
  back = loadImage("cardboard.jpg");
  //noFill();
  noStroke();
  //stroke(0, 50);
  background(0);
}

void draw() {
  background(0);
  image(back, 0, 0);
  centerX = mouseX;
  centerY = mouseY;
  radius = height;
  radiusPaper = radius;
  ran = mouseX/10;
  
  fill(0, 50);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.0105, frameCount/20);
    circumferenceX = centerX-1 + radiusPaper * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY-1 + radiusPaper * sin(radians(i)) * noiseFactor;
    curveVertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  fill(255);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.0105, frameCount/20);
    circumferenceX = centerX + radiusPaper * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY + radiusPaper * sin(radians(i)) * noiseFactor;
    curveVertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  fill(0, 50);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.01, frameCount/20);
    circumferenceX = centerX+1 + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY+1 + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  //fill(0);
  beginShape();
  texture(video);
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.01, frameCount/20);
    circumferenceX = centerX + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY, circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
}

void movieEvent(Movie m) {
  m.read();
}