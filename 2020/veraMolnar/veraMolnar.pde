float numX = 10;
float numY = 10;

int numRect = 1;
float sizeW;
float sizeH;

void setup() {
  size(500, 500, P3D);
  sizeW = width/numX;
  sizeH = height/numY;

  noFill();
  stroke(255);

  background(0);
  rectMode(CENTER);
}

void draw() {
  background(0);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < width; y++) {
      //for (int i = 0; i < numRect; i++) {
        pushMatrix();        
        translate(sizeW*x+sizeW/2, sizeH*y+sizeH/2);
        rotate(radians(random(-15, 15)));
        rect(0, 0, sizeW, sizeH);
        popMatrix();
      //}
    }
  }
}

class Rectangle {
}
