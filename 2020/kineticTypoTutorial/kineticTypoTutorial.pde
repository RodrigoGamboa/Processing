PGraphics pg;
PFont font;

int tilesX = 10;
int tilesY = 10;

int tileW;
int tileH;

int sx, sy, sw, sh;
int dx, dy, dw, dh;

void setup() {
  font = createFont("RobotoMono-Regular.ttf", 300);
  size(400, 400, P2D);
  pg = createGraphics(400, 400, P2D);

  tileW = int(width/tilesX);
  tileH = int(height/tilesY);
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
  pg.text("a", 0, 0);
  pg.popMatrix();
  pg.endDraw();
  //image(pg, 0, 0);

  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      //noFill();
      //stroke(255);
      //rect(x*tileW, y*tileH, tileW, tileH);

      int wave = int(sin(frameCount * 0.01 + ( x * y )) * 100);

      // SOURCE
      sx = x*tileW + wave;
      sy = y*tileH;
      sw = tileW;
      sh = tileH;

      // DESTINATION
      dx = x*tileW;
      dy = y*tileH;
      dw = tileW;
      dh = tileH;

      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    }
  }
}
