int lados = 5;
float radius = 100;

float stepLado;
int cenX, cenY;
float posX, posY;


void setup() {
  size(500, 500);
    stepLado = 360/lados;
    cenX = width/2;
    cenY = height/2;
      noFill();
}

void draw() {
  background(255);
  for (int i = 0; i < 2; i++) {
    pushMatrix();
    translate(cenX, cenY);
    
    beginShape();
    for (int d = 0; d < 360; d+=stepLado) {
      posX = radius*(i+1) * cos(radians(d));
      posY = radius*(i+1) * sin(radians(d));
      vertex(posX, posY);
      rotate(radians(i*36));
      text(d, posX, posY);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
