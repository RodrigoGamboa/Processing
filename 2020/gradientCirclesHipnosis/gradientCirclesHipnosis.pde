float radius;

void setup() {
  size(500, 500);
  radius = width/2;
  background(0);
}

void draw() {
  float time = float(millis())/500;
  for (int i = 0; i < radius*2; i++) {
    noFill();
    stroke(map(i, 0, radius*2, 0, 255*sin(i*0.01*time)));
    ellipse(width/2, height/2, i, i);
  }
}
