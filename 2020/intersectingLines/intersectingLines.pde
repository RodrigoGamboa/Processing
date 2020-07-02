int cols = 10;
int rows = 10;
int rectSize = 100;
int difX, difY;
float rot = 0;
float rotDif = 0.0;

void setup() {
  size(540, 960, P3D);

  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  smooth(2);
  noCursor();

  //noStroke();
  difX = width/cols;
  difY = height/rows;
  rotDif = 0.01;
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float cenX = difX/2 + difX*i;
      float cenY = difY/2 + difY*j;
      pushMatrix();
      translate(cenX, cenY);
      rotateZ(rot);
      fill(360-mouseY/2, 100, 100, 10);
      stroke(mouseY/2, 100, 100);
      rect(0, 0, rectSize*rot, rectSize*rot);
      popMatrix();
      
      pushMatrix();
      translate(cenX, cenY);
      rotateZ(-rot);
      noFill();
      stroke(mouseY/2, 100, 100);
      rect(0, 0, rectSize*rot, rectSize*rot);
      popMatrix();
      //fill(0, 10);
      //rect(width/2, height/2, width-100, height-100);
    }
  }
  rot = sin(rot)+frameCount*rotDif;
}
