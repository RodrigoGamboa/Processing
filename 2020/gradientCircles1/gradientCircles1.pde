Circle[] circles;
int numCircles = 5;

void setup() {
  size(500, 500);
  circles = new Circle[numCircles];
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circle(random(width), random(height), random(100));
  }
}

void draw() {
  //background(255);
  float time = float(millis())/300;
  for (int i = 0; i < width; i++) {
    stroke(map(i, 0, width, 0, 255*sin(i*0.01*time)));
    line(i, 0, i, height);
  }
  for (Circle circle:circles) {
    circle.display();
  }
}

class Circle {
  float cenX;
  float cenY;
  float posX;
  float posY;
  float radius;

  Circle(float cenX_, float cenY_, float radius_) {
    cenX = cenX_;
    cenY = cenY_;
    radius = radius_;
  }

  void display() {
    noFill();
    stroke(127);
    ellipse(cenX, cenY, radius*2, radius*2);
    strokeWeight(3);
    for (int i = 0; i < 360; i++) {
      if (i < 180)
        stroke(map(i, 0, 180, 0, 255));
      else
        stroke(map(i, 181, 360, 255, 0));
      posX = cenX + radius * cos(radians(i));
      posY = cenY + radius * sin(radians(i));

      if (i < 180)
        stroke(map(i, 0, 180, 0, 255));
      else
        stroke(map(i, 181, 360, 255, 0));
      line(cenX, cenY, posX, posY);
    }
  }
}
