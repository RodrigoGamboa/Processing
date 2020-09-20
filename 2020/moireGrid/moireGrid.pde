void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  float time = float(millis())/1000;
  for (int i = 0; i < width; i++) {
    if (i % 2 == 0) {      
      line(i, 0, i, height);
    }
  }
  
  for (int i = 0; i < height; i++) {
    if (i % 2 == 0) { 
      pushMatrix();
      translate(width/2, height/2);
      rotate(map(sin(time), -1, 1, 0, 2*PI));
      line(0, i, width, i);
      popMatrix();
    }
  }
}
