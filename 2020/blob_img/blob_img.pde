int degrees = 360;
int centerX, centerY;
float circumferenceX, circumferenceY;
int radius;
int ran = 5;
float noiseFactor;
PImage img;

void setup() {
  size(500, 500, P3D);
  img = loadImage("background.png");
  noFill();
  noStroke();
  background(0);
}

void draw() {
  background(0);
  centerX = mouseX;
  centerY = mouseY;
  radius = height/2;
  ran = mouseX/10;
  //fill(255);
  beginShape();
  texture(img);
  
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.02, float(frameCount)/150);
    circumferenceX = centerX + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY, circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
}
