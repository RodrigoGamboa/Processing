PGraphics pg;
PFont font;

String text1 = "creative";
String text2 = "coding";
String text3 = "mid";

float text1W, text2W, text3W;
float text1Asc, text2Asc, text3Asc;

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
    //pg.translate(width/2, height/2-100);
    //pg.textAlign(CENTER, CENTER);
    text1W = pg.textWidth(text1);
    text1Asc = pg.textAscent();
    text2W = pg.textWidth(text2);
    text2Asc = pg.textAscent();
    text3W = pg.textWidth(text3);
    text3Asc = pg.textAscent();
    
    pg.text(text1, 0, text1Asc);
    //pg.text(text2, 0, text1Asc + text2Asc);
    //pg.text(text3, 0, text1Asc + text2Asc);

  pg.popMatrix();
  pg.endDraw();  
}

void copyPG() {
  int tilesX = 10;
  int tilesY = 10;
  float text1X = 0;
  float text1Y = text1Asc;
  float tilesW = text1Asc/tilesX;
  float tilesH = text1Asc/tilesY;  //Verificado con mouseY

  float x1 = 0;
  float y1 = 0;
  float w1 = tilesW;
  float h1 = tilesH;
  float x2 = 0;
  float y2 = 0;
  float w2 = 0;
  float h2 = 0;
  int i = 0;
  int rep = 20;
  int stretchLine = tilesX/2;
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

      if (x < stretchLine) {
        x1 = x*tilesW;
        x2 = x1;
      } else if (x >= stretchLine/2 && x <= stretchLine + stretch) {
        x1 = (x-i)*tilesW;
        x2 = x*tilesW;
        i++;
      } else {
        x1 = (x-i)*tilesW;
        x2 = x*tilesW;
      }

      


      copy(pg, int(x1), int(y1), int(w1), int(h1), int(x2), int(y2), int(w2), int(h2));

      //noFill();
      //stroke(127);
      //rect(x1, y1, w1, h1);
      //rect(x2, y2, w2, h2);
    }
  }

}
