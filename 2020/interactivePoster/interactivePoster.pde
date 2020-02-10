PFont font;
int ran = 250;

void setup() {
  size(450, 600);
  font = createFont("UncialAntiqua-Regular", 32);
  textFont(font);
}

void draw() {
  background(255);
  loadPixels();
  for (float x = 0; x < width; x++) {
    for (float y = 0; y < height; y++) {
      float loc = x+y*width;
      float d = abs((dist(x, y, width/2, height/2)));
      float colorD = map(y, 0, random(width-ran, width), 255, 0);
      //stroke(colorD);
      //point(x, y);
      pixels[int(loc)] = color(colorD, 0, 0); 
    }
  }
  updatePixels();
  fill(255);
  textAlign(CENTER);
  for (int i = 0; i < 10; i++) {
    fill(19*i);
    text("INTERACTIVE POSTER", width/2, 100*i);
    fill(50*i, 0, 0);
    text("                     P     ", width/2, 50*i);
  }
  
}
