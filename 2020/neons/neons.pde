int numNeon = 3;
Neon[] neons;

void setup() {
  size(500, 500);
  neons = new Neon[numNeon];
  for (int i = 0; i < numNeon; i++) {
    neons[i] = new Neon(6);
  }
}

void draw() {
  background(255);
  noFill();
  for (Neon neon : neons) {
    neon.display();
  }
}

class Neon {
  int curves;
  float[] randomX;
  float[] randomY;
  float noiseFactor;
  float speed;

  Neon (int curves_) {
    curves = curves_;
    randomX = new float[curves];
    randomY = new float[curves];
    for (int i = 0; i < curves; i++) {
      randomX[i] = random(width);
      randomY[i] = random(height);
    }
    speed = 5;
  }

  void display() {
    for (int x = 0; x < 5; x++) {
      stroke(255, x*50, 200, 200);
      strokeWeight(11-2*x);
      beginShape();
      for (int i = 0; i < curves; i++) {
        noiseFactor = noise(i*speed/100, float(frameCount)/150);
        curveVertex(randomX[i], randomY[i]);
      }
      endShape();
    }
  }
}
