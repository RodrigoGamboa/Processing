int countRect = 100;
int radius = 0;
int inc = 0;
void setup() {
  size(500, 500);
}
void draw() {
  //background(map(mouseY, 0, height, 0, 255));
  countRect = 100;
  inc = 10;
  
  noStroke();
  fill(map(mouseY, 0, height, 255, 0));
  for (int i = 0; i < countRect; i++) {
    noStroke();
    ellipse(random(width), random(height), 20, 20);
    stroke(map(mouseY, 0, height, 255, 0));
    line(random(width), random(height), width/2, height/2);
    for (int j = 0; j < 100; j++) {
      point(random(width), random(height));
    }
  }
  
  noFill();
  stroke(255, mouseX);
  for (int r = 1; r < 100; r++) {
    ellipse(width/2 + random(-5, 5), height/2 + random(-5, 5), radius/r, radius/r);
  }
  radius += inc;
  if (radius >= width) { radius = 0; }
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
}
