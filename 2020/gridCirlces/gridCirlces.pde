int numX = 10;
int numY = 10;

float sizeX, sizeY;
Circles circle;
int numCircles;

void setup() {
  size(500, 500);
  numCircles = numX * numY;
  sizeX = width / numX;
  sizeY = height / numY;
  circle = new Circles(sizeX);
  noStroke();
}

void draw() {
  background(0);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      circle.create(x*sizeX+sizeX/2, y*sizeY+sizeY/2);
    }
  }
  noLoop();
}

class Circles {
  float x, y, d;
  int black;

  Circles (float d_) {
    d = d_;
    
  }

  void create(float x_, float y_) {
    x = x_;
    y = y_;
    black = int(random(-2, 2));
    for (int i = 0; i < 10; i++) {
      if (black == -1) fill(0);
      else fill(255);
      ellipse(x, y, sizeX/i, sizeY/i);
      black *= -1;
    }
  }
}
