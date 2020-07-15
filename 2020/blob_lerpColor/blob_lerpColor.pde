color colorA = color(255);//color(76, 161, 175);
color colorB = color(196, 229, 209);//color(196, 224, 229);
float x = 0;
void setup() {
  //size(500, 500);
  fullScreen();
  noFill();
  rectMode(CENTER);
  background(0);
}

void draw() {
  stroke(lerpColor(colorA, colorB, 0.002*x), 20);
  blob(width/2, height/2, x);
  x++;
  if (x > height) {
    x = 0;
  }
}

void blob(int x, int y, float radius) {
  //noFill();
  //stroke(255);
  int degrees = 360;
  float noiseFactor;
  float circX, circY;
  beginShape();
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.02, float(frameCount)/150);
    circX = x + radius * cos(radians(i)) * noiseFactor;
    circY = y + radius * sin(radians(i)) * noiseFactor;
    curveVertex(circX, circY);
  }
  endShape(CLOSE);
}
