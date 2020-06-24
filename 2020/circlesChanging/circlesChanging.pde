//Ref: https://www.youtube.com/watch?v=bmztlO9_Wvo&t=1189s
//El código aún necesita mejorarse. El movimiento no se ve fluido.
void setup() {
  size(500, 1000);
  noStroke();
}

void draw() {
  background(0);
  float time = millis()/50;
  for(int i=0; i < 900; i++) {
    fill(127+127*sin(i*0.01+time), 127+127*sin(i*0.011+time), 127+127*sin(i*0.012+time));
    ellipse(250 + 100*sin(i*0.02+time), 25+i, 50+40*sin(i*0.005+time), 50+40*sin(i*0.005+time));
  }
}
