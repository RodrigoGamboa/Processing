import processing.video.*;
Movie movie1, movie2, movie3;
float colorR, colorG, colorB = 0;
PFont typo;

void setup()
{
  size(1280, 720);
  //textSize(32);
  typo = createFont("VCR_OSD_MONO_1.001.ttf", 20);
  textFont(typo);
  movie1 = new Movie(this, "policias.mp4");
  movie2 = new Movie(this, "policias.mp4");
  movie3 = new Movie(this, "policias.mp4");

  //movie1.speed(3.0);
  //movie2.speed(3.0);
  //movie3.speed(3.0);
  
  movie1.loop();
  movie2.loop();
  movie3.loop();

  //movie1.volume(0);
  //movie2.volume(0);

  movie2.jump(0.2);
  movie3.jump(0.6);
}

void draw()
{
  
  //tint(240, 255, 13, 126);
  tint(255, 255, 255, 126);
  image(movie1, 0, 0);
  filter(GRAY);
  
  //tint(255, 13, 224, 126);
  tint(0, 255, 0, 126);
  image(movie2, 0, 0);
  //tint(0, 222, 255, 126);
  tint(255, 0, 0, 126);
  image(movie3, 0, 0);
  
  
  //colorR = colorR+1;
  processingImage();
  println(millis());
  text(millis()/1000, 10, 30);
}

void movieEvent(Movie movie)
{
  movie.read();
}

void processingImage()
{
  loadPixels();
  for (int i=0; i < width*height; i++)
  {
    colorR = red(pixels[i]);
    colorG = green(pixels[i]);
    colorB = blue(pixels[i]);
  }
  text(colorR, 0, 60);
  text(colorG, 0, 90);
  text(colorB, 0, 120);
}
