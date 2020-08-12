int numRad = 10;

Radial[] radials;
float time;

void setup() {
  size(500, 500);
  //fullScreen();
  radials = new Radial[numRad];
  for (int i = 0; i < numRad; i++) {
    radials[i] = new Radial(random(width), random(height), random(50, 150), random(1,5));
  }
  background(255);
}

void draw() {
  //background(200);
  
  for (Radial radial : radials) {
    radial.display();
  }
  noStroke();
  fill(255, map(mouseX, 0, width, 0, 255));
  rect(0, 0, width, height);
}

class Radial {
  //Variables
  float cenX;
  float cenY;
  float radius;
  float time;
  float timeVal;
  float posX;
  float posY;
  boolean inter;

  Radial(float cenX_, float cenY_, float radius_, float timeVal_) {
    cenX = cenX_;
    cenY = cenY_;
    radius = radius_;
    timeVal = timeVal_;
    inter = false;
  }

  void display() {
    strokeWeight(0.5);
    stroke(map(sin(time), -1, 1, 0, 255));
   
    time = float(millis())/(timeVal*100);
    pushMatrix();
    translate(cenX, cenY);
    rotate(radians(time*10));
    for (int d = 0; d < 360; d+=20) {
      posX = radius * cos(radians(d));
      posY = radius * sin(radians(d));
      if (inter == true) {
        line(0, 0, map(sin(time), -1, 1, posX/2, posX), map(sin(time), -1, 1, posY/2, posY));
        ellipse(map(sin(time), -1, 1, posX/2, posX), map(sin(time), -1, 1, posY/2, posY), 20, 20);
      } else {
        line(0, 0, map(cos(time), -1, 1, posX/2, posX), map(cos(time), -1, 1, posY/2, posY));
        ellipse(map(cos(time), -1, 1, posX/2, posX), map(cos(time), -1, 1, posY/2, posY), 20, 20); 
      }
      inter = !inter;
    }
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') saveFrame("squids.png");
}
