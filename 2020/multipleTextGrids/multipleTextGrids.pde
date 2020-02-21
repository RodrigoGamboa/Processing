String text_1 = "creative";
String text_2 = "mid";
float textWidth_1;
float textWidth_2;
float textAsc_1;
float textAsc_2;
float tilesW_1;
float tilesH_1;
float tilesW_2;
float tilesH_2;
float adjustAsc;
float x1; 
float y1; 
float x2;
float y2;

//Set Position of text
int textX_1 = 50;
float textY_1 = 100;
int textX_2 = 0;
float textY_2 = 200;
//Set Resolution (X/Y)
int tilesX = 10;
int tilesY = 10;

void setup() {
  size(400, 400);

  textSize(50);
  textWidth_1 = textWidth(text_1);
  textWidth_2 = textWidth(text_2);
  textAsc_1 = textAscent();
  textAsc_2 = textAscent();
  tilesW_1 = textWidth_1/tilesX;
  tilesH_1 = textAsc_1/tilesY;
  tilesW_2 = textWidth_2/tilesX;
  tilesH_2 = textAsc_2/tilesY;

  
}

void draw() {
  noFill();
  stroke(0);
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      x1 = x*tilesW_1 + textX_1;
      y1 = y*tilesH_1 + textY_1 - textAsc_1;
      x2 = x*tilesW_2 + textX_2;
      y2 = y*tilesH_2 + textY_2 - textAsc_2;
            
      rect(x1, y1, tilesW_1, tilesH_1);
      rect(x2, y2, tilesW_2, tilesH_2);
    }
  }
  
  fill(255);
  text(text_1, textX_1, textY_1);
  text(text_2, textX_2, textY_2);
}
