import controlP5.*;

ControlP5 cp5;

Knob knob1;
int knob1Value;

void setup() {
  size(500, 500);
  cp5 = new ControlP5(this);
  knob1 = cp5.addKnob("knob1Value")
             .setPosition(width/2-100, height/2-100)
             .setRadius(100)
             .setRange(0, 155)
             .setValue(50);
}

void draw() {
  background(255);
  println(knob1Value); 
}
