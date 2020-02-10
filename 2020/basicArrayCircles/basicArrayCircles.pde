int numCircles = 10;
int[] randomX = new int[numCircles];
int[] randomY = new int[numCircles];

void setup() {
  size(500, 500);
  for (int i = 0; i < numCircles; i++) {
    randomX[i] = int(random(width));
    randomY[i] = int(random(height));
  }
}

void draw() {
  for (int i = 0; i < numCircles; i++) {
    ellipse(randomX[i], randomY[i], 16, 16);
  }
}
