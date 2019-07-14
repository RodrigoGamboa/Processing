PImage img;
PFont Font1;
color[] colorPixel;
//char letras[] = {'P', 'R', 'O', 'C', 'E', 'S', 'I', 'N', 'G'};
char letras[] = { 'F', 'L', 'Y' };
int rectW = 10;
int rectH = 10;

void setup()
{
  size(400, 400);
  frameRate(8);
  
  Font1 = createFont("ProcessingSansPro-Semibold", 18);
  img = loadImage("fly.png");
  colorPixel = new color[width * height];
  
  textFont(Font1);
  textSize(8);

  loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      pixels[loc] = img.pixels[loc];
      colorPixel[loc] = img.pixels[loc];
    }
  }
  updatePixels();
  
  /*
  //STATIC
  background(0);
  for (int x = 0; x < width; x=x+10)
  {
    for (int y = 0; y < height; y=y+10)
    {
      //fill(random(255), random(255), random(255));
      //rect(x * rectW, y * rectH, rectW, rectH);
      int loc = x + y * width;
      fill(colorPixel[loc]);
      int index = int(random(letras.length));
      text(letras[index], x, y);
    }
  }
  */
}

void draw()
{
  //IN MOVEMENT
  //textSize(12);
  background(0);
  for (int x = 0; x < width; x = x + 8)
  {
    for (int y = 0; y < height; y = y + 8)
    {
      //fill(random(255), random(255), random(255));
      //rect(x * rectW, y * rectH, rectW, rectH);
      int loc = x + y * width;
      fill(colorPixel[loc]);
      int index = int(random(letras.length));
      text(letras[index], x, y);
    }
  }
  
}
