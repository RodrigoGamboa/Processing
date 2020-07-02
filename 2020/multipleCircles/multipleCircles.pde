int filas = 30;
int columnas = 30;
float x, y;

void setup() {
  size(500, 500, P2D);
  background(255);
  x = width/columnas;
  y = height/filas;
  //frameRate(10);
}

void draw() {
  background(0);
  float xrandom = random(x);
  float yrandom = xrandom;
  for (int i=0; i < filas; i++) {
    for (int j=0; j < columnas; j++) {
      //rect(i*x, j*y, x, y); 
      
      ellipse(i*x+x/2, j*y+y/2, xrandom, yrandom);
    }
  }
}
