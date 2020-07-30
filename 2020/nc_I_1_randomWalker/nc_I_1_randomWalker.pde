Walker walker;

void setup() {
  size(500, 500);
  walker = new Walker();
  background(255);
}

void draw() { 
  walker.display();
  walker.step();
}

class Walker{
  float x;
  float y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    strokeWeight(2);
    stroke(0);
    point(x, y);
  }
  
  void step() {
    float steps = 10;
    float choicex = random(-1, 1);
    float choicey = random(-1, 1);
    x += choicex * steps;
    y += choicey * steps;
  }
}
