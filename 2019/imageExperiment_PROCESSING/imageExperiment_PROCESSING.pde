PImage img;

void setup()
{
  size(800, 500);
  img = loadImage("prototype.jpg");
  img.resize(width, height);
  imageMode(CENTER);
  background(255);
  
}

void draw()
{
  for(int x = 0; x <= 100; x = x + 20)
  {
    img.resize(width + x, height - x);
    image(img, width/2, height/2);
  }
  for(int x = 0; x <= 100; x = x + 20)
  {
    img.resize(width + x, height - x);
    image(img, width/2, height/2);
  }
}