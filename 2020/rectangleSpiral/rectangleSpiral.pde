void setup() {
  size(500, 500);
  rectMode(CENTER);
  background(255);
  noStroke();
}

void draw() {
  float time = float(millis())/500;
  fill(map(sin(time), -1, 1, 0, 255));
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(sin(time), -1, 1, 0, 180)));
  rect(0, 0, map(sin(time), -1, 1, 1, width), map(sin(time), -1, 1, 1, width));
  popMatrix();
  fill(255, 10);
  rect(width/2, height/2, width, height);
}
