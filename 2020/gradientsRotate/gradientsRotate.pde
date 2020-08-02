void setup() {
  size(500, 500);
  rectMode(CENTER);
  background(255);
  noFill();
}

void draw() {
  float time = float(millis())/800;
  for (int i = 0; i < width; i++) {
    stroke(map(i, 0, width, 0, 255));
    pushMatrix();
    translate(width/2, height/2);
    //rotate(radians(i/map(mouseX, 0, width, -10, 10)));
    rotate(radians(i/map(sin(time), -1, 1, -5, 5)));
    rect(0, 0, i*2, i*2);
    popMatrix();
  }
}
