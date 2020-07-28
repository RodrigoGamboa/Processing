int numX = 25;
int numY = 50;

float sizeX, sizeY;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  sizeX = width/numX;
  sizeY = height/numY;
}

void draw() {
  background(127);
  for (int y = 0; y < numY; y++) {
    for (int x = 0; x < numX; x++) {
      int ran = int(random(0, 2));
 
      if (ran == 0) {
        for (int i = 0; i < sizeX; i++) {
          stroke(map(i, 0, sizeX, 0, 255));
          line(i+x*sizeX, y*sizeY, i+x*sizeX, (y+1)*sizeY);
        }
      }
          
      if (ran == 1) {
        for (int i = 0; i < sizeY; i++) {
          stroke(map(i, 0, sizeY, 0, 255));
          line(x*sizeX, i+y*sizeY, (x+1)*sizeX, i+y*sizeY);
        }
      }
    }
  }
  noLoop();
  saveFrame("gradients.png");
}
