int numX = 30;
int numY = 30;
float sizeW, sizeH;
float time;
Arrow arrow;

void setup() {
  size(500, 500);
  //size(1080, 1920); 
  arrow = new Arrow();
  sizeW = width/numX;
  sizeH = height/numY;
}

void draw() {
  background(127);
  time = float(millis())/2000;
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {      
      pushMatrix();
      translate(x*sizeW, y*sizeH+sizeH/2);
      noStroke();
      fill(map(sin(x*y*time*0.001), -1, 1, 0, 255));
      rect(0, 0, sizeW, sizeH);
      rotate(radians(map(sin(x*y*time*0.001), -1, 1, 0, 180)));
      //stroke(map(sin(x*y*time*0.001), -1, 1, 255, 0));
      stroke(0);
      arrow.create(0, -sizeH/2, sizeW);
      popMatrix();
    }
  }
}

class Arrow {
  float x, y, w, h;
  Arrow() {
  }
  void create(float x_, float y_, float w_) {
    x = x_;
    y = y_;
    w = w_;
    line(x, y, x + w, y);
    line(x + w, y, x + w - w/4, y - w/4);
    line(x + w, y, x + w - w/4, y + w/4);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("arrowField.png");
  }
}
