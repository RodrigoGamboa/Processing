Circles[] circles;
int numCircles = 10;
float time;

void setup() {
  size(500, 500);
  circles = new Circles[numCircles];
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circles(random(width), random(height));
  }
}

void draw() {
  background(255);
  time = float(millis())/500;
  for (Circles circle : circles) {
    circle.move(time);
    circle.display();
  }
}

class Circles {
  float times;
  float mapeo;
  float mapeoColor;
  float x;
  float y;

  Circles(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void move(float times_) {
    times = times_;
    mapeo = map(sin(times), -1, 1, 0, width);
    mapeoColor = map(sin(times), -1, 1, 0, 255);
  }

  void display() {
    fill(mapeoColor);
    ellipse(x, y, mapeo, mapeo);
  }
}
