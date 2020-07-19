//Ref: https://www.youtube.com/watch?v=bmztlO9_Wvo&t=1189s
//El código aún necesita mejorarse. El movimiento no se ve fluido.
int base = 0;
void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  base = mouseX;
  background(0);
  float time = float(millis())/300;
  for(int i=0; i < 400; i+=1) {
    fill(base+(255-base)*sin(i*0.01+time), base+(255-base)*sin(i*0.011+time), base+(255-base)*sin(i*0.012+time));
    ellipse(250 + 100*sin(i*0.02+time), 25+i, 50+40*sin(i*0.005+time), 50+40*sin(i*0.005+time));
  }
}
