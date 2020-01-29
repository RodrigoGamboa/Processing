//Ref: https://www.youtube.com/watch?v=NbX3RnlAyGU&t=196s

PImage estrom;

void setup() {
  size(523, 290);
  estrom = loadImage("estromatolitos.png");
  background(0);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  //float x = random(width);
  //float y = random(height);
  color c = estrom.get(int(x), int(y));
  fill(c);
  ellipse(x, y, 16, 16);
}
