int degrees = 360;
float cenX, cenY;
float posX, posY;
int distance = 500;
float time;

void setup() {
  size(500, 500, P2D);
  //fullScreen();
  cenX = 0;
  cenY = 0;
}

void draw() {
  background(127);
  distance = mouseX;
  strokeWeight(map(mouseX, 0, width, 5, 0));
  stroke(0, 255);
  time = float(millis())/1000;
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(sin(time), -1, 1, -1, 1)));
  for (int d = 0; d < degrees; d++) {
    posX = cenX + distance * cos(radians(d));
    posY = cenY + distance * sin(radians(d));
    line(cenX, cenY, posX, posY);
  } 
  popMatrix();
  fill(255, 10);
  rect(0, 0, width, height);
}
