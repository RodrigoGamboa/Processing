int numX = 30;
int numY = 30;
float sizeW, sizeH;
float time;

void setup() {
  size(500, 500);
  //size(1080, 1920); 
  sizeW = float(width)/numX;
  sizeH = float(height)/numY;
}

void draw() {
  background(127);
  time = float(millis())/100;
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {      
      pushMatrix();
      translate(x*sizeW, y*sizeH+sizeH/2);
      noStroke();
      fill(map(sin(x*y*time*0.001), -1, 1, 0, 255), map(sin(x*y*time*0.0011), -1, 1, 0, 255), map(sin(x*y*time*0.0012), -1, 1, 0, 255));
      rect(0, 0, sizeW, sizeH);
      rotate(radians(map(sin(x*y*time*0.001), -1, 1, 0, 180)));
      //stroke(map(sin(x*y*time*0.001), -1, 1, 255, 0));
      popMatrix();
    }
  }
}


void keyPressed() {
  if (key == 's') {
    saveFrame("arrowField.png");
  }
}
