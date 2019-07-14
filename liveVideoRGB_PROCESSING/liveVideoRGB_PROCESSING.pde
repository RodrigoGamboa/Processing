import processing.video.*;

Capture video1, video2;

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
  size(320, 240);
  video1 = new Capture(this, 320, 240);
  video1.start();
  video2=video1;
  //movie.volume(0);
  //movie2.jump(0.5);
  //movie3.jump(1);
}

void draw()
{
  processingImage();
  //image(video1, 0, 0);
  tint(255, 0, 0, 126);
  image(video2, 0, 0);
}

void captureEvent(Capture video)
{
  video.read();
}

void processingImage()
{
  video2.loadPixels();
  for(int i = 0; i < video2.width * video2.height; i++)
  {
    colorR = red(video2.pixels[i]);
    colorG = green(video2.pixels[i]);
    colorB = blue(video2.pixels[i]);
    if(colorR >= 100 &&  colorG >= 10 && colorB >= 100)
    {
      video2.pixels[i] = black;
    }
  }
  video2.updatePixels();
}
