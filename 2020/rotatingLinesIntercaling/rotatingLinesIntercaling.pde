int degrees = 360;
float cenX, cenY;
float posX, posY;
int distance = 500;
float time;
boolean loong = true;

void setup() {
  size(500, 500);
  cenX = 0;
  cenY = 0;
  background(255);
}

void draw() {
  background(255);
  distance = mouseX;
  strokeWeight(2);
  stroke(0, 120);
  noFill();
  time = float(millis())/1000;
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(sin(time), -1, 1, -45, 45)));
  for (int d = 0; d < degrees; d+=10) { 
    posX = cenX + distance * cos(radians(d));
    posY = cenY + distance * sin(radians(d));
    if(loong == true)
      line(cenX, cenY, map(sin(time), -1, 1, 50, posX), map(sin(time), -1, 1, 50, posY));
    else 
      line(cenX, cenY, map(sin(time), -1, 1, posX, 50), map(sin(time), -1, 1, posY, 50));
    loong = !loong;
  } 
  popMatrix();
}
