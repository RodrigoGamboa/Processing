PImage img;

void setup()
{
  size(500, 500);
  img = loadImage("monkey.jpg");
  img.resize(0, 500);
}

void draw()
{
  loadPixels();
  img.loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      if (r > mouseX && g > mouseY && b > mouseX)
      {
        pixels[loc] = color(255, 255, 255);
        ;
      } else
      {
        pixels[loc] = color(0, 0, 0);
      }
    }
  }
  updatePixels();
  //println(mouseX + ", " + mouseY + ", " + mouseX);
}

void  keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      saveFrame("monkey2.jpg");
      println("Listo!");
    }
  }
}
