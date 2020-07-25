int curves = 20;
float[] randomX = new float[curves];
float[] randomY = new float[curves];

void setup() {
  size(500, 500);
  background(0);
  noFill();
  //frameRate(2);
}
void draw() { 
  background(0);
  for (int i = 0; i < curves; i++) {
    randomX[i] = random(width);
    randomY[i] = random(height);
  }
  for (int x = 0; x < 5; x++) {
    stroke(255, x*50, 200, 200);
    strokeWeight(11-2*x);
    beginShape();
    for (int i = 0; i < curves; i++) {
      curveVertex(randomX[i], randomY[i]);
    }
    endShape();
  }
}
