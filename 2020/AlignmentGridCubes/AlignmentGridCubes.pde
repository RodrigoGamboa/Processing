int tilesCount = 20;
int sizeW, sizeH;
float x;
void setup() {
  size(500, 500, P3D);
  smooth(2);

  sizeW = width/tilesCount;
  sizeH = height/tilesCount;
}

void draw() {
  background(255);

  for (int i = 0; i < tilesCount; i++) {
    for (int j = 0; j < tilesCount; j++) {
      pushMatrix();
      translate(sizeW*i+sizeW/2, sizeH*j+sizeH/2, 0);
      rotateX(mouseY*0.005);
      rotateY(mouseX*0.005);
      noStroke();
      fill(0, i*j*cos(x), 255-i*j*sin(x), 100);
      box(20);
      
      
      popMatrix();
    }
  }
  x += 0.05;
  /*
  pushMatrix();
  translate(0, 0, -20);
  fill(sin(x));
  rect(0, 0, width, height);
  popMatrix();
  */
}
