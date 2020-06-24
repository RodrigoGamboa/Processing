void setup() {
  size(500, 500);
  background(0);
  fill(0);
  noStroke();
}

void draw() {
  background(0);
  noStroke();
  float a = random(width);
  float b = random(height);
  float c = random(50, 150);
  float lx = random(width);
  float ly = random(height);
  fill(255, 255, 0);
  ellipse(a, b, c, c);
  float d = dist(c, c, lx, ly);
  //if(d < 50) {
    strokeWeight(d/10);
    //fill(random(127));
    noFill();
    stroke(255);
    line(lx, ly, c, c);
    if(d > 50)
      ellipse(lx, ly, d, d);
  //}
}
