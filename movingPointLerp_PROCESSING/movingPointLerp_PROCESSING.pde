//Code extracted from the Processing forum:
//https://forum.processing.org/two/discussion/16529/how-do-i-make-something-go-directly-to-a-specific-point

float tx=100, ty=100, px=100, py=100;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  px = lerp(px, tx, .1);
  py = lerp(py, ty, .1);
  background(0);
  ellipse(px, py, 10, 10);
}
 
void mousePressed() {
  tx = mouseX;
  ty = mouseY;
}
