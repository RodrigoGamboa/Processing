int cols = 500;
int rows = 500;
float numX, numY;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  numX = width/cols;
  numY = height/rows;
}

void draw() {
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      fill(map(x*y, 0, cols*rows, 0, 360), 100, 100);
      rect(numX*x, numY*y, numX, numY);
    }
  }
}
