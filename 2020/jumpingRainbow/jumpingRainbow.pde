float angle = 0.0;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + width * y;
      pixels[loc] = color(sin(angle)*loc/mouseX, 100, 100);
      //println(loc/1000);
    }
  }
  updatePixels();
  angle += 0.05;
}
