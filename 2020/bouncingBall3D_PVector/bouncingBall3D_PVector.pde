PVector location;
PVector velocity;

void setup() {
  size(500, 500, P3D);
  location = new PVector(random(width), random(height), random(width));
  velocity = new PVector(4, 5, 6);
  background(255);
}

void draw() {
  //background(255);
  
  location.add(velocity);
 
  translate(0, 0, -500);
  
  //box(50);
  
  if(location.x < 0 || location.x > width) {
    velocity.x *= -1;
  }
  if(location.y < 0 || location.y > height) {
    velocity.y *= -1;
  }
  if(location.z < 0 || location.z > width) {
    velocity.z *= -1;
  }
  
  noFill();
  stroke(location.x/2, location.y/2, location.z/2);
  pushMatrix();
  translate(location.x+random(-5, 5), location.y, location.z);
  sphere(mouseX/10);
  popMatrix();

  //fill(255, 20);
  //translate(0, 0, mouseX);
  //rect(0, 0, width, height);
}

class PVector {
  float x;
  float y;
  float z;

  PVector(float x_, float y_, float z_) {
    x = x_;
    y = y_;
    z = z_;
  }
  
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
    z = z + v.z;
  }
}
