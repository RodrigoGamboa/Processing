String text_1 = "creative";
float textWidth_1;
float textAsc_1;
float tilesW;
float tilesH;
float adjustAsc;
float x1;  //First point X of cut
float y1;  //First point Y of cut
/*
float w1;  //Width of cut
float h1;  //Height of cut
float x2;  //Second point X of paste
float y2;  //Second point Y of paste
float w2;  //Width of paste
float h2;  //Height of paste
*/

//Set Position of text
int textX_1 = 50;
float textY_1 = 100;
//Set Resolution (X/Y)
int tilesX = 10;
int tilesY = 10;

void setup() {
  size(400, 400);

  textSize(50);
  textWidth_1 = textWidth(text_1);
  textAsc_1 = textAscent();
  tilesW = textWidth_1/tilesX;
  tilesH = textAsc_1/tilesY;

  
}

void draw() {
  noFill();
  stroke(0);
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      x1 = x*tilesW + textX_1;
      y1 = y*tilesH + textY_1 - textAsc_1;
      rect(x1, y1, tilesW, tilesH);
    }
  }
  
  fill(255);
  text(text_1, textX_1, textY_1);
}
