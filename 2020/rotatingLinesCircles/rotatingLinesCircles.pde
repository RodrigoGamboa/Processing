int degrees = 360;
float cenX, cenY;
float posX, posY;
int distance = 500;
float time;

void setup() {
  size(500, 500);
  cenX = 0;
  cenY = 0;
  background(255);
}

void draw() {
  distance = mouseX;
  strokeWeight(0.1);
  stroke(0, 120);
  noFill();
  time = float(millis())/1000;
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(sin(time), -1, 1, -90, 90)));
  for (int d = 0; d < degrees; d+=10) {
    posX = cenX + distance * cos(radians(d));
    posY = cenY + distance * sin(radians(d));
    line(cenX, cenY, posX, posY);
    ellipse(posX, posY, width-distance, width-distance);
  } 
  popMatrix();
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
}
