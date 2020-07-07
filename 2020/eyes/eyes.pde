int tilesCount = 10;
float sizeW, sizeH;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  noStroke();
  sizeW = width/tilesCount;
  sizeH = height/tilesCount;
}

void draw() {
  background(255);
  
  
  for (int i=0; i < tilesCount; i++) {
    for (int j=0; j < tilesCount; j++) {
      pushMatrix();
      translate(sizeW*i+sizeW/2, sizeH*j+sizeH/2);
      fill(0);
      rect(0, 0, sizeW, sizeH);
      fill(255);
      arc(0, 0, sizeW, sizeH/2, 0, 2*PI, OPEN);
      fill(0);      
      ellipse(map(mouseX, 0, width, -sizeW/2, sizeW/2),
      map(mouseY, 0, height, -sizeH/2, sizeH/2), 200/tilesCount, 200/tilesCount);
      
      popMatrix();
    }
  }
}
