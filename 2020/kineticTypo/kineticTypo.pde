PGraphics pg;
PFont font;

int ran = 0;
int yes = 0;

void setup() {
  font = createFont("RobotoMono-Regular.ttf", 600);
  size(800, 800, P2D);
  //fullScreen(P2D);
  pg = createGraphics(width, height, P2D);
}

void draw() {
  background(0);
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.textFont(font);
  pg.textSize(800);
  pg.pushMatrix();
  pg.translate(width/2, height/2-215);
  pg.textAlign(CENTER, CENTER);
  pg.text("a", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  
  //image(pg,0,0);
  
  int tilesX = 8;
  int tilesY = 8;
  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      int x1 = x*tileW;
      int y1 = y*tileH;
      int w1 = tileW;
      int h1 = tileH;
      
      int x2 = x*tileW + int(random(-ran, ran));
      int y2 = y*tileH + int(random(-ran, ran));
      //int x2 = x*tileW + int(random(-mouseX/2, mouseX/2));
      //int y2 = y*tileH + int(random(-mouseY/2, mouseY/2));
      int w2 = tileW;
      int h2 = tileH;
      
      copy(pg, x1, y1, w1, h1, x2, y2, w2, h2);
    }
  }
  if(yes == 1 && ran < width/2) {
    ran++;
  } else {
    ran = 0;
    yes = 0;
  }
}

void mousePressed() {
  yes = 1;
}

void keyPressed() {
  if (key == ENTER) {
    yes = 1;
  }
}
