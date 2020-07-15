int degrees = 360;
float centerX, centerY;
float pointX, pointY;
float radius;

void setup() {
  size(500, 500, P3D);
  centerX = width/2;
  centerY = height/2;
  radius = height/3;
  noFill();
  stroke(0, 20);
  rectMode(CENTER);
}

void draw() {
  background(255);
  for (int x = 0; x < degrees; x++) {
    rotateX(x);
    beginShape();
    for (int i = 0; i < degrees; i++) {
      pointX = centerX + radius * cos(radians(i));
      pointY = centerY + radius * sin(radians(i));
      //Intercambiar por rect, line, ellipse
      ellipse(centerX, centerY, pointX, pointY);
    }
  }
  endShape(CLOSE);
}
