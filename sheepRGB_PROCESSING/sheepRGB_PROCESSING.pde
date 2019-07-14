import processing.video.*;
//sheep.mp4 = 480, 480 px
//Hereditary.mp4 = 1280, 720 px
Movie movie1, movie2, movie3;
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
  size(720, 1280);
  movie1 = new Movie(this, "Flash.mp4");
  movie2 = new Movie(this, "Flash.mp4");
  movie3 = new Movie(this, "Flash.mp4");

  movie1.loop();
  movie2.loop();
  movie3.loop();
  //movie.volume(0);
  movie2.jump(0.2);
  movie3.jump(0.6);
}

void draw()
{
  tint(240, 255, 13, 126);
  image(movie1, 0, 0);
  tint(255, 13, 224, 126);
  image(movie2, 0, 0);
  tint(0, 222, 255, 126);
  image(movie3, 0, 0);
}

void movieEvent(Movie movie)
{
  movie.read();
}
