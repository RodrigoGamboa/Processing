//Ejemplo de interacción de cambio de colores cuando se presiona la pantalla touch.
//Parte del experimento de videomapping casero, utilizando la app Processing for iOS.

int colors;

void setup() {
  size(500, 500);  //Utilizar esta función de size() para Processing en la computadora.
  //size(screenWidth, screenHeight);  //Utilizar esta función de size() para Processing for iOS.
  noStroke();
  colors = 255;
}

void draw() {
  background(0);
  fill(colors);
  ellipse(width/2, height/2, width-50, width-50);
}

void mousePressed() {
  colors = color(random(255), random(255), random(255));
}
