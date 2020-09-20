color color1, color2;

void setup() {
  size(500, 500);
}

void draw() {
  float time = float(millis())/500;
  background(255);
  for(int x = 0; x < width; x++) {
    //color1 = lerpColor(color(255, 0, 0), color(0, 0, 255), map(sin(x), -1, 1, 0, 1));
    color2 = lerpColor(color(255, 0, 0), color(0, 0, 255), map(x, 0, width, 0.2, 0.8));
    stroke(color2);
    line(x, 0, x, height);
  }
  for(int x = 0; x < width; x++) {
    //color1 = lerpColor(color(255, 0, 0), color(0, 0, 255), map(sin(x), -1, 1, 0, 1));
    color2 = lerpColor(color(255, 0, 0), color(0, 0, 255), map(x, 0, width, 0.2, 0.8));
    stroke(color2);
    line(x, 0, x*map(sin(time), -1, 1, 0, 5), height);
  }
  
}
