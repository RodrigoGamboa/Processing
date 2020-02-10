PGraphics pg;
PFont font;

int ran = 0;
int yes = 0;

void setup() {
  font = createFont("RobotoMono-Regular.ttf", 300);
  size(400, 400, P2D);
  pg = createGraphics(400, 400, P2D);
}

void draw() {
  background(26, 14, 128);
  pgEvent();
  copyPG();
}

void pgEvent() {
  pg.beginDraw();
  pg.background(26, 14, 128);
  pg.fill(255);
  pg.textFont(font);
  pg.textSize(50);
  pg.pushMatrix();
  pg.translate(width/2, height/2-100);
  pg.textAlign(CENTER, CENTER);
  pg.text("CREA_TIVE", 0, 0);
  pg.text(" coding", 0, 50);
  pg.text("MiD", 0, 100);
  pg.text("!", 0, 150);
  pg.popMatrix();
  pg.endDraw();
}

void copyPG() {
  int tilesX = 200;
  int tilesY = 1;
  int tilesW = width/tilesX;
  int tilesH = height/tilesY;

  int x1 = 0;
  int y1 = 0;
  int w1 = tilesW;
  int h1 = tilesH;
  int x2 = 0;
  int y2 = 0;
  int w2 = 0;
  int h2 = 0;
  int i = 0;
  int rep = 20;
  int stretch = int(map(mouseX, 0, width, 0, rep));
  

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      //int x1 = x*tilesW;
      y1 = y*tilesH;
      w1 = tilesW;
      h1 = tilesH;
      y2 = y1;
      w2 = w1;
      h2 = h1;

      if (x < tilesX/2) {
        x1 = x*tilesW;
        x2 = x1;
      } else if (x >= tilesX/2 && x <= tilesX/2+stretch) {
        x1 = (x-i)*tilesW;
        x2 = x*tilesW;
        i++;
      } else {
        x1 = (x-i)*tilesW;
        x2 = x*tilesW;
      }

      


      copy(pg, x1, y1, w1, h1, x2, y2, w2, h2);

      //noFill();
      //stroke(127);
      //rect(x1, y1, w1, h1);
    }
  }
}
