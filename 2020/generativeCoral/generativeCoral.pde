float inc = 50;

void setup() { 
  size(600, 600);
  //smooth();
  background(0);
  stroke(250, 5);
}
void draw() {
  for (int i=0; i<1000; i++) {
    float x = random(-1, 1);
    float y = random(-1, 1);
    float xx = map(noise(x, y), 0, 1, 50, 550);
    float yy = map(noise(y, x), 0, 1, 50, 550);
    point(xx, yy);
  }
}

/*
value=noise(x, y)
start1=0
stop1=1
start2=50
stop2=550

start2 + (stop2 - start2) * ((value - start1) / (stop1 - start1));
https://forum.processing.org/two/discussion/22471/how-does-mapping-function-work
*/
