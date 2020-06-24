int numCircles = 10;
int[] randomX = new int[numCircles];
int[] randomY = new int[numCircles];
int x, maxX, minX = 0;
int y, maxY, minY = 0;
int dirX, dirY = 1;
int speed = 20;
int circX, circY = 0;

void setup() {
  size(400, 400);
  for (int i = 0; i < numCircles; i++) {
    randomX[i] = int(random(width));
    randomY[i] = int(random(height));
  }
  textSize(100);
  textAlign(CENTER);
  fill(255);
  x = width/2;
  y = height/2;
  maxX = 201;
  minX = 199;
  maxY = 201;
  minY = 199;
  background(203, 0, 122);
  //26, 14, 128
  circX = int(random(width));
  circY = int(random(height));
  noStroke();
}

void draw() {
  //background(0);
  maxX = int(random(width-20, width));
  minX = int(random(0, 20));
  maxY = int(random(height-20, height));
  minY = int(random(0, 20));
  fill(203, 0, 122);
  for (int i = 0; i < numCircles; i++) {
    ellipse(randomX[i], randomY[i], 50, 50);
  }
  fill(255);
  text("h", width/2-50, height/2);
  text("y!", width/2+70, height/2);
  text("e", x, y);
  if (dirX == 1 && x < maxX) {
    x = x + speed;
    if (x >= maxX) {
      dirX = 0;
    }
  } else if (dirX == 0 && x > minX) {
    x = x - speed;
    if (x <= minX) {
      dirX = 1;
    }
  }
  if (dirY == 1 && x < maxY) {
    y = y + speed;
    if (y >= maxY) {
      dirY = 0;
    }
  } else if (dirY == 0 && y > minY) {
    y = y - speed;
    if (y <= minY) {
      dirY = 1;
    }
  }
  fill(26, 14, 128, 30);
  rect(0, 0, width, height);
}
