import controlP5.*;

ControlP5 cp5;

Knob knob1, knob2, knob3, knob4;
int knob1Value, knob2Value, knob3Value, knob4Value;

int count = 1;
Blob[] blobs;

void setup() {
  size(500, 500);
  blobs = new Blob[count];
  for (int i = 0; i < count; i+=1) {
    blobs[i] = new Blob(width/2, height/2, random(100, 250));
  }

  cp5 = new ControlP5(this);
  knob1 = cp5.addKnob("knob1Value")
    .setPosition(0, 0)
    .setRadius(30)
    .setRange(0, 255)
    .setValue(127);
  knob2 = cp5.addKnob("knob2Value")
    .setPosition(60, 0)
    .setRadius(30)
    .setRange(0, 255)
    .setValue(127);
  knob3 = cp5.addKnob("knob3Value")
    .setPosition(120, 0)
    .setRadius(30)
    .setRange(0, 255)
    .setValue(127);
  knob4 = cp5.addKnob("knob4Value")
    .setPosition(180, 0)
    .setRadius(30)
    .setRange(0, 255)
    .setValue(127);
}

void draw() {
  //background(255);
  for (Blob blob : blobs) {
    blob.shapeFill(-1, 0);
    blob.shapeDisplay();
  }
  fill(255, knob4Value);
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

  Blob(float cenX_, float cenY_, float radius_) {
    cenX = cenX_;
    cenY = cenY_;
    radius = radius_;
  }

  void shapeFill(float fill_, float stroke_) {
    speed = knob4Value;
    if (fill_ < 0) {
      noFill();
    } else {
      //fill(fill_);
      //fill(fillR, fillG, fillB, 30);
      fill(knob1Value, knob2Value, knob3Value);
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
