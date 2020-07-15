int degrees = 360;
int centerX, centerY;
float circumferenceX, circumferenceY;
float radius, radiusPaper;
int ran = 5;
float noiseFactor;
PImage img, back;

void setup() {
  size(500, 500, P2D);
  img = loadImage("background.png");
  back = loadImage("cardboard.jpg");
  //noFill();
  //noStroke();
  stroke(0, 50);
  background(0);
}

void draw() {
  background(0);
  image(back, 0, 0);
  centerX = mouseX;
  centerY = mouseY;
  radius = height/2;
  radiusPaper = radius;
  ran = mouseX/10;
  fill(0, 50);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.0105, frameCount/10);
    circumferenceX = centerX-1 + radiusPaper * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY-1 + radiusPaper * sin(radians(i)) * noiseFactor;
    curveVertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  fill(255);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.0105, frameCount/10);
    circumferenceX = centerX + radiusPaper * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY + radiusPaper * sin(radians(i)) * noiseFactor;
    curveVertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  fill(0, 50);
  beginShape();
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.01, frameCount/10);
    circumferenceX = centerX+1 + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY+1 + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
  
  //fill(0);
  beginShape();
  texture(img);
  for (int i = 0; i < degrees; i = i+10) {
    noiseFactor = noise(i*0.01, frameCount/10);
    circumferenceX = centerX + radius * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY + radius * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY, circumferenceX, circumferenceY);
  }
  endShape(CLOSE);
}
