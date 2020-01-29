int x = 0;
genEllipses


void setup() {
  size(500, 500);
  background(255);
}

void draw() { 
  pushMatrix();
    stroke(random(255));
    translate(width/2, height/2);
    for (int i=0; i < 100; i++) {
      rotate(radians(x));
      //rect(-25, -25, 50, 50);
      line(50, 50, 0, 0);
      x++;
    }
  popMatrix();

  fill(255);
  ellipse(width/2, height/2, 50, 50);
}

class genEllipses() {

}
