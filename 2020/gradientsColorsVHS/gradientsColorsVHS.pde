int numX = 1;
int numY = 1;

float sizeX, sizeY;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  noCursor();
  sizeX = width/numX;
  sizeY = height/numY;
}

void draw() {
  background(127);
  float time = float(millis())/500;
  for (int y = 0; y < numY; y++) {
    for (int x = 0; x < numX; x++) {
      for (int i = 0; i < sizeX; i++) {
        //stroke(map(i, 0, sizeX, 0, 255));
        stroke(127*sin(i*0.01*time), mouseX*sin(i*0.02*time), mouseY*sin(i*0.03*time));
        line(i+x*sizeX, y*sizeY, i+x*sizeX, (y+1)*sizeY);
      }
    }
  }
}
