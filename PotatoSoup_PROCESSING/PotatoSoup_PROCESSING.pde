import processing.video.*;

Movie movie;
color pink = color(255, 102, 204);
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color colorPixel;
float colorR, colorG, colorB;
int val = 0;
int countPixels = 0;
int[] circles;
PImage sopa;

void setup()
{
  size(480, 480);
  sopa = loadImage("SopaPapas.jpg");
  sopa.resize(0, 480);
  fill(255);
  textSize(50);
}

void draw()
{
  loadPixels();
  sopa.loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      float r = red(sopa.pixels[loc]);
      float g = green(sopa.pixels[loc]);
      float b = blue(sopa.pixels[loc]);
      if (r > 84 && g > 150 && b > 0)
      {
        pixels[loc] = color(mouseX, mouseY, val);        
      }
      else
      {
        pixels[loc] = color(r, g, b);
      }
    }
  }
  updatePixels();
  println(mouseX + ", " + mouseY + ", " + val);
}

void movieEvent(Movie movie)
{
  movie.read();
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == DOWN) 
    {
      val++;
      if (val > 255)
      {
        val = 255;
      }
    } else if (keyCode == UP) 
    {
      val--;
      if (val < 0)
      {
        val = 0;
      }
    } else if (keyCode == LEFT)
    {
      val = 0;
    } else if (keyCode == RIGHT)
    {
      val = 255;
    }
  } else 
  {
  }
}
