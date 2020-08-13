int numBoxes = 10;
float sizeW, sizeH;
Boxx[] boxxes;

void setup() {
  size(500, 500, P3D);
  //size(1080, 1920, P3D);
  noFill();
  sizeW = float(width)/numBoxes;
  sizeH = float(height)/numBoxes;
  boxxes = new Boxx[numBoxes*numBoxes];
  for (int i = 0; i < numBoxes*numBoxes; i++) {
    boxxes[i] = new Boxx(random(radians(180)), random(radians(180)), random(radians(180)), random(sizeW), random(sizeW), random(sizeW), int(random(255)), int(random(255)), int(random(255)));
  }
  background(255);
}

void draw() {
  background(255);
  noFill();
  stroke(0, 100);
  for (int x = 0; x < numBoxes; x++) {
    for (int y = 0; y < numBoxes; y++) {
      pushMatrix();
      translate(sizeW*x+sizeW/2, sizeH*y+sizeH/2);        
      boxxes[x+y*numBoxes].display();
      popMatrix();
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
  int r, g, b;
  float time;

  Boxx (float rotX_, float rotY_, float rotZ_, float w_, float h_, float d_, int r_, int g_, int b_) {
    rotX = rotX_;
    rotY = rotY_;
    rotZ = rotZ_;
    w = w_;
    h = h_;
    d = d_;
    r = r_;
    g = g_;
    b = b_;
  }

  void display() {
    fill(r, g, b, 100);
    time = float(millis())/3000;
    rotateX(map(sin(time/rotX*0.001), -1, 1, 0, 180));
    rotateY(map(sin(time/rotY*0.0011), -1, 1, 0, 180));
    rotateZ(map(sin(time/rotZ*0.0012), -1, 1, 0, 180));
    box(w, h, d);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("boxes.png");
  }
}
