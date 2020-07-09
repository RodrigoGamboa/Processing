int degrees = 360;
int centerX1, centerY1, centerX2, centerY2;
float circumferenceX, circumferenceY;
int radius1, radius2;
int ran = 5;
float noiseFactor;

void setup() {
  size(850, 500);
  noCursor();
  noFill();
  noStroke();
  background(0);
  radius1 = height;
  radius2 = height;
}

void draw() {
  background(0);

  centerX1 = mouseX;
  centerY1 = mouseY;
  centerX2 = mouseX;
  centerY2 = mouseY;
  
  ran = mouseX/10;
  fill(255);
  noStroke();
  beginShape();
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.02, float(frameCount)/150);
    circumferenceX = centerX1 + radius1 * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY1 + radius1 * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY);
  }
  endShape(CLOSE);

  noFill();
  stroke(0, 50);
  for(int x = 0; x < 50; x++) {
  beginShape();
  for (int i = 0; i < degrees; i++) {
    noiseFactor = noise(i*0.02, float(frameCount)/150);
    circumferenceX = centerX2 + radius2 * cos(radians(i)) * noiseFactor;
    circumferenceY = centerY2 + radius2 * sin(radians(i)) * noiseFactor;
    vertex(circumferenceX, circumferenceY);
  }
  radius2 -= 10;
  if(radius2 < 0) radius2 = height; 
  endShape(CLOSE);
  }
}
