Form form;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  //form = new Form(número de lados);
  form = new Form(5);
}

void draw() {
  float time = float(millis())/2000;
  background(255);
  noFill();
  for (int i = 0; i < 360; i++) {
    stroke(map(i, 0, 360, 255, 0));
    strokeWeight(map(i, 0, 360, 0.1, 3));
    fill(0, map(i, 0, 360, 0, 255));
    pushMatrix();
    //rotate(radians(i*map(mouseX, 0, width, -20, 20)));
    rotate(radians(i*sin(time)));
    //form.display(width/2, height/2, i*10);
    
    form.display(width/2, height/2, i);
    popMatrix();
  }
  //fill(255, 80);
  //rect(0, 0, width, height);
}

class Form {
  int lados;
  int radius;
  float step;
  float cenX;
  float cenY;
  float posX;
  float posY;

  Form(int lados_) {
    lados = lados_;
    step = 360/lados;
  }

  void display(float cenX_, float cenY_, int radius_) {
    cenX = cenX_;
    cenY = cenY_;
    radius = radius_;

    beginShape();
    for (int d = 0; d < 360; d += step) {
      posX = cenX + radius * cos(radians(d));
      posY = cenY + radius * sin(radians(d));
      vertex(posX, posY);
    }
    endShape(CLOSE);
  }
}
