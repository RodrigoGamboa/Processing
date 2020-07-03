int tileCount = 20;
int actStrokeCap;
int project = 0;

void setup() {
  size(1080, 1920);
}

void draw() {

  if (project == 1) {
    background(255);
    strokeCap(actStrokeCap);
    for (int gridY = 0; gridY < tileCount; gridY++) {
      for (int gridX = 0; gridX < tileCount; gridX++) {
        int posX = width / tileCount * gridX;
        int posY = height / tileCount * gridY;
        int toggle = int(random(0, 2));
        if (toggle == 0) {
          strokeWeight(mouseX / 20);
          line(posX, posY, posX + width/tileCount, posY + height/tileCount);
        }
        if (toggle == 1) {

          strokeWeight(mouseY / 20);
          line(posX, posY + height/tileCount, posX + width/tileCount, posY);
        }
      }
    }
    project = 0;
    save("data.png");
  }
}

void keyReleased() {
  if (key == '1') actStrokeCap = ROUND;
  if (key == '2') actStrokeCap = SQUARE;
  if (key == '3') actStrokeCap = PROJECT;
  if (key == '4') project = 1;
}
