Cross cross;
int numXY = 60;
float sizeWH;

void setup() {
  size(500, 500);
  cross = new Cross();
  sizeWH = (width+height/2)/numXY;
}

void draw() {
  background(0);
  float time = float(millis())/100;
  for (int x = 0; x < numXY; x++) {
    for (int y = 0; y < numXY; y++) {
      pushMatrix();
      stroke(map(sin(x*y+time), -1, 1, 0, 255), map(sin(x*y/time), -1, 1, 0, 255), map(sin(x*y+time), -1, 1, 0, 255));
      translate(x*sizeWH+sizeWH/4, y*sizeWH+sizeWH/4);
      rotate(radians(map(sin(x*y+time), -1, 1, 0, 90)));     
      cross.create(-sizeWH/4, -sizeWH/4, sizeWH*2/3, sizeWH*2/3);
      popMatrix();
    }
  }
  //fill(255, 10);
  //rect(0, 0, width, height);
}

class Cross {
  float x, y, w, h;

  Cross() {
  } 

  void create(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    line(this.x, this.y, this.x + this.w, this.y + this.h);
    line(this.x, this.y + this.h, this.x + this.w, this.y);
  }
}
