int numX = 20;
int numY = 20;
float sizeW, sizeH;
float time;
boolean val = false;

void setup() {
  size(500, 500);
  sizeW = float(width)/numX;
  sizeH = float(height)/numY;
}

void draw() {  
  background(0);
  time = float(millis())/100;
  for (int x = 0; x < numX; x++) {
    if(val == true) fill(255);
    else fill(0);
    for (int y = 0; y < numY; y++) {
      //rect(sizeW*x+map(sin(y+time), -1, 1, -10, 10), sizeH*y, sizeW, sizeH);
      ellipse(sizeW*x+sizeW/2+map(sin(y+time), -1, 1, -10, 10), sizeH*y+sizeH/2, sizeW, sizeH);
    }
    val = !val;
  }
}
