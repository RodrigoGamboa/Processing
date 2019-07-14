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

void setup()
{
  size(480, 480);
  frameRate(30);
  movie = new Movie(this, "sheep.mp4");
  movie.loop();
  //movie.volume(0);

  fill(255);
  textSize(50);
}

void draw()
{
  circles = new int[movie.width*val];
  //movie.width*movie.height  //auto
  //movie.width * val  //con flechas

  movie.loadPixels();
  for (int x = 0; x < movie.width; x++)
  {
    for (int y = 0; y < movie.height; y++)
    {
      int loc = y * movie.width + x;

      colorR = red(movie.pixels[loc]);
      colorG = green(movie.pixels[loc]);
      colorB = blue(movie.pixels[loc]);
      if (colorR < 150 && colorG < 150 && colorB < 150)
      {
        movie.pixels[loc] = black; //Fondo negro
        //movie.pixels[i] = color(colorR, 0, 0);  //Filtro rojo
      } else
      {
        movie.pixels[loc] = white;
        //countPixels++;

        //circles[loc] = movie.pixels[loc];
      }
    }
  }
  movie.updatePixels();

  image(movie, 0, 0);
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
      if (val > movie.height)
      {
        val = movie.height;
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
      val = movie.height;
    }
  } else 
  {
  }
}
