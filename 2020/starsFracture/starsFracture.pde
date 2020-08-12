Fracture[] fractures;
int numFractures = 10;

void setup() {
  size(500, 500);
  fractures = new Fracture[numFractures];
  for (int i = 0; i < numFractures; i++) {
    fractures[i] = new Fracture(random(width), random(height), 4, random(150), random(90)); 
  }
  noFill();
}

void draw() {
  background(255, 0, 0);
  for (Fracture fracture : fractures) {
    fracture.display();
  }
}

class Fracture {
  float cenX;
  float cenY;
  float lados;
  float radius;
  float angle;
  float stepLado;  
  float posX1, posY1;
  float posX2, posY2;

  Fracture(float cenX_, float cenY_, float lados_, float radius_, float angle_) {
    cenX = cenX_;
    cenY = cenY_;
    lados = lados_;
    radius = radius_;
    angle = angle_;
    stepLado = 360/lados;
  }

  void display() {
    pushMatrix();
    translate(cenX, cenY);
    rotate(radians(angle));
    for (int r = 0; r < radius; r++) {   
      stroke(map(r, 0, radius, 0, 255), 0, 0);
      beginShape();
      for (int d = 0; d < 360; d+=stepLado) {
        posX1 = r * cos(radians(d));
        posY1 = r * sin(radians(d));
        posX2 = r*0.2 * cos(radians(d+1));
        posY2 = r*0.2 * sin(radians(d+1));
        vertex(posX1, posY1);
        vertex(posX2, posY2);
      }
      endShape(CLOSE);
    }
    popMatrix();
  }
}
