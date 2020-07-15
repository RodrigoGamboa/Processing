int degrees = 360;
float centerX, centerY;
float pointX, pointY;
float radius;

void setup() {
  size(500, 500);
  centerX = width/2;
  centerY = height/2;
  radius = height/3;
  noFill();
  stroke(0, 20);
  rectMode(CENTER);
}

void draw() {
  background(255);
  beginShape();
  for (int i = 0; i < degrees; i++) {
    pointX = centerX + radius * cos(radians(i) + random(map(mouseX, 0, width, -5, 5)));
    pointY = centerY + radius * sin(radians(i) + random(map(mouseY, 0, height, -5, 5)));
    //Intercambiar por rect, line, ellipse
    ellipse(centerX, centerY, pointX, pointY);  
  }
  endShape(CLOSE);
}
