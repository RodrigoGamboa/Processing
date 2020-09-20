int numX = 10; //17
int numY = 10;  //30
float sizeW, sizeH;

Grids grids;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  sizeW = float(width)/numX;
  sizeH = float(height)/numY;
  grids = new Grids(sizeW, sizeW, sizeH);  
  //frameRate(3);
}

void draw() {
  background(0);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      //if (x % 2 == 0 && y % 2 == 0) {
      pushMatrix();
      translate(sizeW*x, sizeH*y);
      grids.create(int(x+y*numX));
      popMatrix();
      //}
    }
  }
  stroke(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(mouseX, 0, width, 0, 360)));
  for(int i = 0; i < width; i+=3) {    
    //line(i, -height/2, i, height/2);
  }
  popMatrix();
}

class Grids {
  float num, steps;
  float sizeW, sizeH;
  int[] ran;
  int ranIndex;

  Grids(float num_, float sizeW_, float sizeH_) {
    num = num_;
    sizeW = sizeW_;
    sizeH = sizeH_;
    steps = sizeW/num;
    ran = new int[numX*numY];
    for(int i = 0; i < numX*numY; i++) {
      ran[i] = int(random(0, 2));
    }
  }

  void create(int ranIndex_) {
    ranIndex = ranIndex_;
    if (ran[ranIndex] == 0) {
      for (int i = 0; i < sizeW; i += steps) {
        //stroke(lerpColor(color(255, 0, 0), color(0, 0, 255), map(i, 0, sizeW, 0, 1)));
        stroke(lerpColor(color(255, 0, 0), color(0, 0, 255), map(i, 0, sizeW, 0, 1)));
        //stroke(map(i, 0, sizeW, 0, 255));
        //strokeWeight(map(i, 0, sizeW, 0.1, 20));
        line(0, i, sizeH, i);
      }
    } else {
      for (int i = 0; i < sizeH; i += steps) {
        stroke(lerpColor(color(255, 0, 0), color(0, 0, 255), map(i, 0, sizeW, 0, 1)));
        //stroke(map(i, 0, sizeW, 255, 0));
        //strokeWeight(map(i, 0, sizeW, 0.1, 3));
        line(i, 0, i, sizeW);
      }
    }
  }
}

void keyPressed() {
  if(key == 's') {
    saveFrame("gradientColors.png");
  }
}
