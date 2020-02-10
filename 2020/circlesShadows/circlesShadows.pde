//Circles myCirc;
Circles[] myCircs = new Circles[50];

void setup() {
  size(500, 500);
  //myCirc = new Circles();
  for (int i = 0; i < myCircs.length; i++) {
    myCircs[i] = new Circles();
  }
}

void draw() {
  //myCirc.display();
  for (int i = 0; i < myCircs.length; i++) {
    myCircs[i].display();
  }
}

class Circles {
  int circleX = int(random(width));
  int circleY = int(random(height));
  int circleSize = int(random(40, 50));
  //int jitter = int(random(5,10));
  int jitter = mouseX/10;
  void noise() {
  
  }
  void display() {
    stroke(0);
    fill(0);
    ellipse(circleX+jitter, circleY+jitter, circleSize-abs(jitter)/2, circleSize-abs(jitter)/2);
    fill(127);
    ellipse(circleX, circleY, circleSize, circleSize);
  }
}
