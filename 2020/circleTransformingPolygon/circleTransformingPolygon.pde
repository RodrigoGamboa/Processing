int numX = 10;
int numY = 18;
float sizeW;
float sizeH;

Form form;

void setup() {
  //size(500, 500);
  size(1080, 1920);
  sizeW = width/numX;
  sizeH = height/numY;
  form = new Form();
}

void draw() {
  background(0);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      pushMatrix();
      translate(sizeW*x+sizeW/2, sizeH*y+sizeH/2);
      fill(map(1+(x+y)*3, 0, 100, 255, 0));
      //rotate(radians(map(x*y, 0, 100, 0, mouseX*3)));
      //rotate(radians(map(sin(x*y*0.01+time), -1, 1, 0, 1000)));
      form.display(1+(x+y)*3);
      popMatrix();
    }
  }
}

class Form{
  int step;
  float posX;
  float posY;
  
  Form() {
  }
  
  void display(int step_) {
    step = step_;
    beginShape();
    for (int d = 0; d < 360; d+=step) {
      posX = (sizeW/2) * cos(radians(d));
      posY = (sizeH/2) * sin(radians(d));
      vertex(posX, posY);
    }
    endShape(CLOSE);
  }
}

void keyPressed() {
  if(key == 's') {
    saveFrame("change.png");
  }
}
