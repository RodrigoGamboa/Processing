void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(0);
  blob(mouseX, mouseY, height/2);
}

void blob(int x, int y, float radius) {
  noFill();
  stroke(255);
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
