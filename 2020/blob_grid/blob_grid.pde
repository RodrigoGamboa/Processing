int degrees = 360;
float centerX, centerY;
float circumferenceX, circumferenceY;
float radius;
int ran = 5;
float noiseFactor;

int tilesCount = 7;
float sizeW, sizeH;

void setup() {
  size(500, 500);
  noFill();
  //stroke(255);
  noStroke();
  background(0);
  sizeW = width/tilesCount;
  sizeH = height/tilesCount;
}

void draw() {
  
  for (int x = 0; x < tilesCount; x++) {
    for (int y = 0; y < tilesCount; y++) {
      centerX = sizeW/2+sizeW*x;
      centerY = sizeH/2+sizeH*y;
      radius = sizeW/2;
      fill(50+x*y*20, 255, 50+x*y*20);
      beginShape();
      for (int i = 0; i < degrees; i++) {
        noiseFactor = noise(i*x*y*0.0009, float(frameCount)/5);
        circumferenceX = centerX + radius * cos(radians(i)) * noiseFactor;
        circumferenceY = centerY + radius * sin(radians(i)) * noiseFactor;
        curveVertex(circumferenceX, circumferenceY);
      }
      endShape(CLOSE);
      //ellipse(sizeW*x + sizeW/2, sizeH*y + sizeH/2, sizeW, sizeH);
    }
  }


  /*
  centerX = width/2;
   centerY = height/2;
   radius = height/2;
   ran = mouseX/10;
   fill(255);
   beginShape();
   for (int i = 0; i < degrees; i++) {
   noiseFactor = noise(i*0.02, float(frameCount)/150);
   circumferenceX = centerX + radius * cos(radians(i)) * noiseFactor;
   circumferenceY = centerY + radius * sin(radians(i)) * noiseFactor;
   curveVertex(circumferenceX, circumferenceY);
   }
   endShape(CLOSE);
   */
}
