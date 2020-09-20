int numX = 20;
int numY = 20;
float sizeW, sizeH;
 Blobs[] blobs;

void setup() {
  size(500, 500);
  sizeW = float(width) / numX;
  sizeH = float(height) / numY;
  blobs = new Blobs[numX * numY];
  for(int i = 0; i < numX * numY; i++) {
    blobs[i] = new Blobs(random(sizeW/5, sizeW), random(0.005, 0.1), random(10, 150));
  }
}

void draw() {
  background(255);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      pushMatrix();
      //rect(sizeW*x, sizeH*y, sizeW, sizeH);
      translate(sizeW * x + sizeW / 2, sizeH * y + sizeH / 2);
      blobs[x+y*numX].create();
      popMatrix();  
    }
  }
}

class Blobs {
  float r, ran, speed;
  float posX, posY;
  float noiseFactor;

  Blobs (float r_, float ran_, float speed_) {
    r = r_;
    ran = ran_;
    speed = speed_;
  }

  void create() {  
    beginShape();
    for (int d = 0; d < 360; d++) {
      noiseFactor = noise(d*ran, float(frameCount)/speed);
      posX = r * cos(radians(d)) * noiseFactor;
      posY = r * sin(radians(d)) * noiseFactor;
      vertex(posX, posY);
    }
    endShape(CLOSE);
  }
}
