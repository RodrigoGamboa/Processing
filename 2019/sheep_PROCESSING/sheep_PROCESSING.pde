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
  for (int i = 0; i < movie.width*val; i++)
  {
    colorR = red(movie.pixels[i]);
    colorG = green(movie.pixels[i]);
    colorB = blue(movie.pixels[i]);
    if (colorR < 150 && colorG < 150 && colorB < 150)
    {
      movie.pixels[i] = black; //Fondo negro
      //movie.pixels[i] = color(colorR, 0, 0);  //Filtro rojo
    } else
    {
      movie.pixels[i] = white;
      countPixels++;
      
      circles[i] = movie.pixels[i];
      //println(i);
      //movie.pixels[i]  = color(random(0, 255), 0, 0);
    }
  }
  movie.updatePixels();

  image(movie, 0, 0);
  
  //circles[177329];
  //ellipse(20, int(177329/width)+1, 20, 20);
  /*
  for (int i = 0; i < movie.width*val; i++)
  {
    ellipse(20, 20, 20, 20);
  }
  */
  //fill(random(0, 255), random(0, 255), random(0, 255));
  text(countPixels, 20, height - 20);
  countPixels = 0;
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
