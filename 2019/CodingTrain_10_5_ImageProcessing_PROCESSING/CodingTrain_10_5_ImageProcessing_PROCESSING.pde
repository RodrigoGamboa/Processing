PImage img;

void setup()
{
  size(560, 440);
  img = loadImage("Bacalar.jpg");
}

void draw()
{
  loadPixels();
  img.loadPixels();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      pixels[loc] = color(r, g/2, b*2);
    }
  }
  updatePixels();
}
