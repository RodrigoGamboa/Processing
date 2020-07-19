int count = 100;
Car[] cars;

void setup () {
  size(500, 500);
  cars = new Car[count];
  for (int i = 0; i < count; i++) {
    cars[i] = new Car(random(width), random(height), random(2, 10));
  }
  background(255);
}

void draw() {
  //background(255);
  for (Car car : cars) {
    car.move();
    car.display();
  }
  fill(255, map(mouseX, 0, width, 0, 50));
  rect(0, 0, width, height);
}

class Car {
  color c;
  float x;
  float y;
  float yi;
  float speed;

  Car(float x_, float y_, float speed_) {
    c = color(0);
    x = x_;
    y = yi = y_;
    speed = speed_;
  }

  void move() {
    y -= speed;
    if (y < 0) { 
      y = yi;
    }
  }

  void display() {
    fill(c);
    ellipse(x, y, 30, 30);
  }
}
