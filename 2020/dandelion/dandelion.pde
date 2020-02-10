void setup() {
  size(500, 500);
  background(0);
  //translate(width/2, height/2);
}

void draw() {
  int ang = 0;
  float x = random(width);
  float y = random(height);
  translate(x, y);
  for (int i=0; i < 200; i++) {
    stroke(random(255));
    rotate(radians(ang));
    //rect(-25, -25, 50, 50);
    line(random(50), random(50), 0, 0);
    ang++;
    if(radians(ang) > PI) {
      ang = 0;
    }
  }
  //INCOMPLETO: Colocar la elipse en el centro
  /*
  noStroke();
  fill(0);
  ellipse(mouseX, mouseY, 8, 8);
  */
  

}

void mousePressed() {

}
