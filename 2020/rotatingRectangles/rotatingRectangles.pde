int numX = 10;
int numY = 10;
float sizeW;
float sizeH;

void setup() {
  size(500, 500);
  //size(1080, 1920);

  sizeW = width/numX;
  sizeH = height/numY;
  noStroke();
}

void draw() {
  background(0);
  float time = float(millis())/1000;
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      pushMatrix();
      translate(sizeW*x, sizeH*y);
      fill(map(x*y, 0, 100, 255, 0));
      rotate(radians(map(x*y, 0, 100, 0, mouseX*3)));
      //rotate(radians(map(sin(x*y*0.01+time), -1, 1, 0, 1000)));
      rect(0, 0, sizeW, sizeH);
      popMatrix();
    }
  }
}
