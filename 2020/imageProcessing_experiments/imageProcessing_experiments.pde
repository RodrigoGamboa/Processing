PImage estrom;

void setup() {
  size(523, 290);
  estrom = loadImage("estromatolitos.png");
}

void draw() {
  //image(estrom, 0, 0);
  loadPixels();
  estrom.loadPixels();
  for (int x = 0; x < width-1; x++) {
    for (int y = 0; y < height; y++) {
      int loc1 = x+y*width;
      int loc2 = (x+1)+y*width;
      float b1 = brightness(estrom.pixels[loc1]);
      float b2 = brightness(estrom.pixels[loc2]);
      float diff = abs(b1-b2);
      pixels[loc1] = color(diff);
      
      
      //CHANGE THE COLOR OF THE SIGN
      /*
      float b = brightness(estrom.pixels[loc]);
      if (b > 63) {
        pixels[loc] = color(estrom.pixels[loc]);
      } else {
        pixels[loc] = color(255);        
      }
      */

      //FLASHLIGHT EFFECT
      /*
      float r = red(estrom.pixels[loc]);
      float g = green(estrom.pixels[loc]);
      float b = blue(estrom.pixels[loc]);
      float d = dist(mouseX, mouseY, x, y);
      float factor = map(d, 0, 20, 2, 0);
      pixels[loc] = color(r*factor, g*factor, b*factor);
      */
    }
  }
  updatePixels();
  //println(mouseX); //63
}
