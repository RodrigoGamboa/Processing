int numX = 40;
int numY = 40;

float sizeW, sizeH;

void setup() {
  size(500, 500);
  sizeW = float(width)/numX;
  sizeH = float(height)/numY;
  ellipseMode(CORNER);
}

void draw() {
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      int ran = int(random(0, 2));
      if (ran == 0)
        ellipse(x*sizeW, y*sizeH, sizeW, sizeH);
      else
        rect(x*sizeW, y*sizeH, sizeW, sizeH);
    }
  }
  noLoop();
}
