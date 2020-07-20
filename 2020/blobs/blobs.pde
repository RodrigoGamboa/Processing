int count = 25;
Blob[] blobs;

void setup() {
  size(500, 500);
  blobs = new Blob[count];
  for (int i = 0; i < count; i+=1) {
    blobs[i] = new Blob(random(width), random(height), random(100, 250), random(10), random(255), random(255), random(255));
  }
}

void draw() {
  background(255);
  for (Blob blob : blobs) {
    blob.shapeFill(1, 1);
    blob.shapeDisplay();
  }
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
}

class Blob {
  float cenX;
  float cenY;
  float radius;
  float speed;
  float posX;
  float posY;
  float noiseFactor;
  float fillR;
  float fillG;
  float fillB;

  Blob(float cenX_, float cenY_, float radius_, float speed_, float fillR_, float fillG_, float fillB_) {
    cenX = cenX_;
    cenY = cenY_;
    radius = radius_;
    speed = speed_;
    fillR = fillR_;
    fillG = fillG_;
    fillB = fillB_;
  }

  void shapeFill(float fill_, float stroke_) {
    if (fill_ < 0) {
      noFill();
    } else {
      //fill(fill_);
      fill(fillR, fillG, fillB, 30);
    } 
    if (stroke_ < 0) {
      noStroke();
    } else {
      //stroke(stroke_);
      stroke(fillR, fillG, fillB, 50);
    }
  }

  void shapeDisplay() {
    beginShape();
    for (int i = 0; i < 360; i++) {
      noiseFactor = noise(i*speed/100, float(frameCount)/150);
      posX = cenX + radius * cos(radians(i)) * noiseFactor;
      posY = cenY + radius * sin(radians(i)) * noiseFactor;
      curveVertex(posX, posY);
    }
    endShape(CLOSE);
  }
}
