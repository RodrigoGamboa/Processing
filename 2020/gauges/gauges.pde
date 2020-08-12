int numX = 50;
int numY = 50;
float sizeW, sizeH;
float time;
Arrow arrow;

void setup() {
  size(500, 500);
  //size(1080, 1920); 
  arrow = new Arrow();
  sizeW = width/numX;
  sizeH = height/numY;
  strokeWeight(2);
  stroke(0);
}

void draw() {
  background(255, 127, 0);
  time = float(millis())/2000;
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {      
      pushMatrix();
      translate(x*sizeW*2, y*sizeH*2+sizeH/2);        
      //stroke(map(sin(x*y*time*0.001), -1, 1, 255, 0));
      ellipse(0, 0, sizeW*2, sizeW*2);
      rotate(radians(map(sin(x*y*time*0.01), -1, 1, 0, 180)));
      arrow.create(0, 0, sizeW-sizeW/5);
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
