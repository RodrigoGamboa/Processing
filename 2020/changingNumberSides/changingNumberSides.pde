int radius = 100;

int lados = 50;
float step;
float cenX, cenY;
float posX, posY;

float[] pointsX;
float[] pointsY;

float time;

void setup() {
  size(500, 500);
  step = 360/lados;
  pointsX = new float[lados];
  pointsY = new float[lados];
  cenX = width/2;
  cenY = height/2;
  background(255);
}

void draw() {
  stroke(0);
  strokeWeight(0.5);
  time = float(millis())/500;
  //lados = int(map(mouseX, 0, width, 3, 20));
  lados = int(map(sin(time), -1, 1, 5, 20));
  step = 360/lados;
  //radius = int(map(mouseY, 0, height, 1, 200));
  radius = int(map(cos(time), -1, 1, 1, 200));
  cenX = mouseX;
  cenY = mouseY;
  
  noFill();
  beginShape();
  for (int d = 0; d < 360; d+=step) {    
    posX = cenX + radius * cos(radians(d));
    posY = cenY + radius * sin(radians(d));
    vertex(posX, posY);
    //ellipse(posX, posY, 20, 20);
    pointsX[int(d/step)] = posX;
    pointsY[int(d/step)] = posY;
  }
  endShape(CLOSE);
  fill(255, 20);
  for (int i = 0; i < lados; i++) {
    ellipse(pointsX[i], pointsY[i], 20, 20);
  }
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);
}
