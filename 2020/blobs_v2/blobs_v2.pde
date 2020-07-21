Flower[] flowers;
int numFlowers = 20;

void setup() {
  size(500, 500);
  flowers = new Flower[numFlowers];
  for (int i = 0; i < numFlowers; i++) {
    flowers[i] = new Flower(200, random(width), random(height), random(10));
  }
}

void draw() {

  //background(255);
  noFill();
  stroke(255);
  for (Flower flower : flowers) {
    flower.display();
  }


  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
}

class Flower {
  float radius;
  float radiusCurrent;
  float cenX;
  float cenY;
  float speed;
  float posX;
  float posY;
  float noiseFactor;
  int degrees = 360;

  Flower(float radius_, float cenX_, float cenY_, float speed_) {
    radiusCurrent = radius = radius_;
    cenX = random(width);
    cenY = random(height);
    speed = speed_;
  }

  void display() {
    if (radiusCurrent < 0) {
      radiusCurrent = radius;
    }
    beginShape();
    for (int i = 0; i < degrees; i++) {
      noiseFactor = noise(i*speed/100, float(frameCount)/150);
      posX = cenX + radiusCurrent * cos(radians(i)) * noiseFactor;
      posY = cenY + radiusCurrent * sin(radians(i)) * noiseFactor;
      curveVertex(posX, posY);
    }
    endShape(CLOSE);
  }
}
