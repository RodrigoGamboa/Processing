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
  background(0);
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.textFont(font);
  pg.textSize(400);
  pg.pushMatrix();
  pg.translate(width/2, height/2-100);
  pg.textAlign(CENTER, CENTER);
  pg.text("O", 0, 0);
  pg.popMatrix();
  pg.endDraw();

  //image(pg,0,0);

  int tilesX = 50;
  int tilesY = 50;
  int stretch = mouseX/10;
  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);
  int xStretch = 0;
  //int xCopy = 0;
  int[] xCopy = new int[10000];
  int i = 0;
  int j = 0;
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      int x1 = x*tileW;
      int y1 = y*tileH;
      int w1 = tileW;
      int h1 = tileH;

      //int x2 = x*tileW + int(random(-ran, ran));
      //int y2 = y*tileH + int(random(-ran, ran));
      //int x2 = x*tileW + int(random(-mouseX/2, mouseX/2));
      //int y2 = y*tileH + int(random(-mouseY/2, mouseY/2));
      //int w2 = tileW;
      //int h2 = tileH;
      int x2 = x*tileW;
      int y2 = y*tileH;
      int w2 = tileW;
      int h2 = tileH;
      if (x == tilesX/5) {
        xStretch = x*tileW;
        println(xStretch);
        //x1=x*tileW;
      }
      if (x >= tilesX/5 &&  x <= (tilesX/5 + stretch)) {
        //x2 = xStretch;
        //Puede ser para despues
        x1 = xStretch;
        //x2 = x*tileW+stretch;
        //noFill();
        //xCopy = x*tileW;
        xCopy[i] = x*tileW;
        i++;
      } else if (x > (tilesX/5 + stretch)) {
        //fill(255);
        //x1 = x*tileW;
        x1 = xCopy[j];
        j++;
        x2 = x*tileW + stretch;
        
      }

      copy(pg, x1, y1, w1, h1, x2, y2, w2, h2);
      noFill();
      stroke(255, 0, 0);
      //rect(x2, y2, w2, h2);
    }
  }
  if (yes == 1 && ran < width/2) {
    ran++;
  } else {
    ran = 0;
    yes = 0;
  }
}

void mousePressed() {
  yes = 1;
}
