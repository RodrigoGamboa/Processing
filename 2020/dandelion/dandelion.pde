void setup() {
  size(900, 1000);
  //fullScreen();
  //println(width + ", " + height);
  background(0);
  //translate(width/2, height/2);
}

void draw() {
  //background(mouseX, mouseY, 255);
  noFill();
  int ang = 0;
  //float x = width/2;
  //float y = height/2;
  float x = random(width);
  float y = random(height);
  //float x = mouseX;
  //float y = mouseY;
  
  translate(x, y);
  for (int i=0; i < 500; i++) {
    stroke(random(255), random(255), random(255));
    rotate(radians(ang));
    //rect(-25, -25, 50, 50);
    line(random(100), random(100), 0, 0);
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
  //background(0);
}

void mousePressed() {

}
