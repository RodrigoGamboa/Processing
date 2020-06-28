int filas = 100;
int columnas = 100;
float x, y;

void setup() {
  size(800, 800);
  background(0);
  x = width/columnas;
  y = height/filas;
}

void draw() {
  for(int i=0; i < filas; i++) {
    for(int j=0; j < columnas; j++) {
        //rect(i*x, j*y, x, y);
        ellipse(i*x+x/2, j*y+y/2, random(x), random(y));
    }
  }
}
