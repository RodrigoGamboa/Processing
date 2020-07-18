PVector location;
PVector velocity;

void setup() {
  size(500, 500);
  location = new PVector(random(width), random(height));
  velocity = new PVector(2.0, 5);
}

void draw() {
  location.add(velocity);
  
  if(location.x < 0 || location.x > width) {
    velocity.x *= -1;
  }
  if(location.y < 0 || location.y > height) {
    velocity.y *= -1;
  }
  
  fill(0);
  ellipse(location.x, location.y, 80, 80);
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
}

class PVector {
  //Inicialización de variables
  float x;
  float y;
  
  //Constructor(?)
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  } 
  
  //Función de adición
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}
