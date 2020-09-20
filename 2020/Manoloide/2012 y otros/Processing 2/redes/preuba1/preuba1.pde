Cosa papi;
void setup() {
  size(displayWidth, displayHeight);
  papi = new Cosa(width/2, height/2);
}

void draw() {
  background(0);
/*
  papi.x = mouseX;
  papi.y = mouseY;
*/
  papi.act();
}

void mousePressed() {
  if (dist(mouseX, mouseY, papi.x, papi.y) < papi.tam) {
    papi.crecer(1);
  }
}

void keyPressed() {
  saveFrame("asdas####.png");
}

class Cosa {
  ArrayList<Cosa> cosas;
  Cosa padre;
  float x, y, ang, tam;
  Cosa(float x, float y) {
    this.x = x; 
    this.y = y;
    tam = 10;
    cosas = new ArrayList();
  }
  Cosa(Cosa padre) {
    this.padre = padre;
    ang = random(TWO_PI); 
    tam = 0;
    cosas = new ArrayList();
  }
  void act() {
    if (padre == null) {
      crecer(0.1);
    }
    else {
      x = padre.x + cos(ang) * tam *2;
      y = padre.y + sin(ang) *tam*2;
      ang += 0.005;
    }
    //nivel < 2 && 
    if ((tam/5) -1 > cosas.size()) {
      cosas.add(new Cosa(this));
    }
    draw();
    for (int i = 0; i < cosas.size(); i++) {
      cosas.get(i).act();
    }
  }
  void draw() {
    float alfa = 255;
    if (padre != null) {
      alfa = map(tam, 0, padre.tam, 10, 255);
      stroke(255, alfa);
      strokeWeight(1+tam/20);
      line(x, y, padre.x, padre.y);
    }
    noStroke();
    fill(255, alfa);
    ellipse(x, y, tam*0.4, tam*0.4);
  }

  void crecer(float cre) {
    tam += cre / random(0.9, 1.1);
    for (int i = 0; i < cosas.size(); i++) {
      cosas.get(i).crecer(cre/2);
    }
  }
}

