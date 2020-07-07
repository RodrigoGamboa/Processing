int numBoxes = 5;
int cubeSize = 45;
int spacing = 50;
int totalW, totalH;

void setup() {
  size(500, 500, P3D);
  fill(255, 10);
  totalW = numBoxes * cubeSize * spacing - spacing;
}

void draw() {
  background(255);
  //translate((width - totalW)/2, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3);
  
  for (int i = 0; i < numBoxes; i++) {
    for (int j = 0; j < numBoxes; j++) {
      for (int k = 0; k < numBoxes; k++) { 
        pushMatrix();
        translate(cubeSize*i+spacing*i, cubeSize*j+spacing*j, cubeSize*k+spacing*k);
        box(random(42, 48));
        popMatrix();
      }
    }
  }
}
