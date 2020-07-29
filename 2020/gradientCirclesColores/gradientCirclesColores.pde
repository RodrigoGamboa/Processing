color[] colores;
int numColores = 5;

Circle[] circles;
int numCircles = 30;

void setup() {
  size(500, 500);
  noFill();
  colores = new color[numColores];
  circles = new Circle[numCircles];
  for (int i = 0; i < numColores; i++) {
    colores[i] = color(random(255), random(255), random(255));
  }
  for (int i = 0; i < numCircles; i++) {
    circles[i] = new Circle(random(width), random(height), random(50), colores[int(random(0, numColores))], colores[int(random(0, numColores))]);
  }
}

void draw() {
  background(255);
  for (Circle circle : circles) {
    circle.display();
  }
}

class Circle {
  float radius;
  float posX;
  float posY;
  color colora;
  color colorb; 

  Circle(float posX_, float posY_, float radius_, color colora_, color colorb_) {
    radius = radius_;
    posX = posX_;
    posY = posY_;
    colora = colora_;
    colorb = colorb_;
  }

  void display() {
    for (int i = 0; i < radius*2; i = i++) {
      stroke(lerpColor(colora, colorb, map(i, 0, radius*2, 0, 1)));
      ellipse(posX, posY, i, i);
    }
  }
}
