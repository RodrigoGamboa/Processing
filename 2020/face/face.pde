int tilesCount = 10;
float sizeW, sizeH;

void setup() {
  size(500, 500);
  sizeW = width/tilesCount;
  sizeH = height/tilesCount;
}

void draw() {
  background(255);
  /*
  for (int i = 0; i < tilesCount; i++) {
    for (int j = 0; j < tilesCount; j++) {
    rect(sizeW*i, sizeH*j, sizeW, sizeH);
    ellipse(sizeW*i + sizeW/2, sizeH*j + sizeH/2, 10, 10);
    }
  }
  */
  translate(width/2, height/3);
  fill(0);
  rectMode(CENTER);
  rect(0-sizeW*2, 0, sizeW, sizeH);
  fill(255);
  arc(0-sizeW*2, 0, sizeW, sizeH/2, 0, 2*PI, OPEN);
  fill(0);
  ellipse(-sizeW*2 + map(mouseX, 0, width, -sizeW/2+sizeW/6, sizeW/2-sizeW/6), map(mouseY, 0, height, -sizeH/2+sizeH/6, sizeH/2-sizeH/6), sizeW/3, sizeH/3);
  rect(0+sizeW*2, 0, sizeW, sizeH);
  fill(255);
  arc(0+sizeW*2, 0, sizeW, sizeH/2, 0, 2*PI, OPEN);
  fill(0);
  ellipse(sizeW*2 + map(mouseX, 0, width, -sizeW/2+sizeW/6, sizeW/2-sizeW/6), map(mouseY, 0, height, -sizeH/2+sizeH/6, sizeH/2-sizeH/6), sizeW/3, sizeH/3);
  arc(0, sizeH*3, width/2, map(mouseX, 0, width, 0, sizeH*3), 0, 2*PI, OPEN);
}
