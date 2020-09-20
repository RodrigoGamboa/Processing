int numBoxes = 100;
Boxx[] boxxes;

float sizeBox;

void setup() {
  size(500, 500, P3D);
  //size(1080, 1920, P3D);
  sizeBox = (width+height/2)*5/numBoxes;
  //sizeBox = width/numBoxes;
  boxxes = new Boxx[numBoxes];
  for (int i = 0; i < numBoxes; i++) {
    //Boxx (width, height, depth, rotX, rotY, rotZ, r, g, b, x, y, velX, velY);
    boxxes[i] = new Boxx(random(sizeBox), random(sizeBox), random(sizeBox), 
                random(radians(180)), random(radians(180)), random(radians(180)),
                random(255), random(255), random(255), random(width), random(height),
                random(0.5), random(0.5));
  }
}

void draw() {
  background(255);
  for (Boxx boxxe : boxxes) {
    boxxe.move();
    boxxe.display();
  }
}

class Boxx {
  float w, h, d, rotX, rotY, rotZ, r, g, b, x, y, velX, velY;
  float time;

  Boxx (float w_, float h_, float d_, float rotX_, float rotY_, float rotZ_, float r_, float g_, float b_, float x_, float y_, float velX_, float velY_) {
    w = w_;
    h = h_;
    d = d_;
    rotX = rotX_;
    rotY = rotY_;
    rotZ = rotZ_;
    r = r_;
    g = g_;
    b = b_;
    x = x_;
    y = y_;
    velX = velX_;
    velY = velY_;
  }

  void move() {
    x += velX;
    y += velY;

    if (x < 0 || x > width) {
      velX *= -1;
    }
    if (y < 0 || y > height) {
      velY *= -1;
    }
  }
  
  void display() {
    fill(r, g, b, 100);
    time = float(millis())/3000;
    pushMatrix();
    translate(x, y);
    rotateX(map(sin(time/rotX*0.001), -1, 1, 0, 180));
    rotateY(map(sin(time/rotY*0.0011), -1, 1, 0, 180));
    rotateZ(map(sin(time/rotZ*0.0012), -1, 1, 0, 180));    
    box(w, h, d);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("bouncingBoxes.png");
  }
}
