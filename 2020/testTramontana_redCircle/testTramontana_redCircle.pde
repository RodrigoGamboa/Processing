//Ejemplo de Tramontana (app) con Processing para probar proyección de un círculo rojo sobre papel como superficie.

import tramontana.library.*;
import websockets.*;

Tramontana t;

String img;

void setup() {
  size(400, 200);
  t = new Tramontana(this, "192.168.0.3");  //Aquí colocar la IP de la app Tramontana.
  img = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Circle-red.svg/1200px-Circle-red.svg.png";
}
void draw() { 
  for (int i = 0; i < width; i++) {
    stroke(map(i, 0, width, 0, 255));
    line(i, 0, i, height);
  }

  noStroke();
  fill(255, 0, 0, 50);
  ellipse(mouseX, mouseY, 75, 75);
}

void mousePressed() {
  t.setColor(int(map(mouseX, 0, width, 0, 255)), int(map(mouseX, 0, width, 0, 255)), int(map(mouseX, 0, width, 0, 255)), 255);
  t.showImage(img);
}
