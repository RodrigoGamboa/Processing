int stepX;
int stepY;

void setup() {
  size(800, 400);
  noCursor();
  noStroke();
  colorMode(HSB, width, height, 100);
}

void draw() {
  stepX = mouseX + 2;
  stepY = mouseY + 2;
  
  for (int i = 0; i < height; i += stepY) {
    for (int j = 0; j < width; j += stepX) {
      fill(j, width-i, 100);
      rect(j, i, stepX, stepY);
    }
  }
}
