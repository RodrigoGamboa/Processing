import processing.sound.*;
WhiteNoise noise;
SinOsc sine;

void setup() {
  size(640, 360);
  background(255);
    
  //Create the noise generator.
  noise = new WhiteNoise(this);
  noise.play();
    
  // Create the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
}

void draw() {
}