int numBoxes = 5;
float sizeW, sizeH;
Boxx[] boxxes;

void setup() {
  size(500, 500, P3D);
  noFill();
  sizeW = width/numBoxes;
  sizeH = height/numBoxes;
  boxxes = new Boxx[numBoxes*numBoxes];
  for (int i = 0; i < numBoxes*numBoxes; i++) {
    boxxes[i] = new Boxx(random(radians(180)), random(radians(180)), random(radians(180)), random(sizeW), random(sizeW), random(sizeW));
  }
  background(255);
}

void draw() {
  background(255);
  noFill();
  stroke(0, 100);
  for (Boxx boxxe : boxxes) {
    for (int x = 0; x < numBoxes; x++) {
      for (int y = 0; y < numBoxes; y++) {
        pushMatrix();
        translate(sizeW*x+sizeW/2, sizeH*y+sizeH/2);
        boxxe.display();
        popMatrix();
      }
    }
  }
}

class Boxx {
  float rotX;
  float rotY;
  float rotZ;
  float w;
  float h;
  float d;

  Boxx (float rotX_, float rotY_, float rotZ_, float w_, float h_, float d_) {
    rotX = rotX_;
    rotY = rotY_;
    rotZ = rotZ_;
    w = w_;
    h = h_;
    d = d_;
  }

  void display() {
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    box(w, h, d);
  }
}
