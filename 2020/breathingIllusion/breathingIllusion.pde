int numX = 8;  //8
int numY = 15;  //15

float sizeX, sizeY;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  noStroke();
  sizeX = width/numX;
  sizeY = height/numY;
}

void draw() {
  background(0);
  float time = float(millis())/1500;
  float mapeo = map(sin(time), -1, 1, width/8, width/3);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {    
      if ((x+y) % 2 == 0)
        fill(255);
      else
        fill(0);
      rect(x*sizeX, y*sizeY, sizeX, sizeY);
      ellipse(x*sizeX, y*sizeY, mapeo, mapeo);      
    }
  }
}
