Typho[] myTypho = new Typho[100];

void setup() {
  size(500, 500);
  //myTypho = new Typho();
  for (int i = 0; i < myTypho.length; i++) {
    myTypho[i] = new Typho();
  }
  textSize(100);
}

void draw() {
  background(255);
  for (int i = 0; i < myTypho.length; i++) {
    myTypho[i].move();
    myTypho[i].display();
  }
}

class Typho {
  char[] letter = {'h', 'e', 'y', '!'};
  int randomLetter = int(random(letter.length));
  int jitter = 20;
  int x = int(random(width));
  int y = int(random(height));
  int minX = x + int(random(5, 10));
  int maxX = x + int(random(5, 10));
  int minY = y + int(random(5, 10));
  int maxY = y + int(random(5, 10));
  int dirX, dirY = 1;
  int speed = 2;
  void move() {
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
  }

  void display() {
    fill(0);
    text(letter[randomLetter], x, y);
  }
}
