PImage img;
PFont Font1, Font2;
color[] colorPixel;
//char letras[] = {'P', 'R', 'O', 'C', 'E', 'S', 'I', 'N', 'G'};
//char letras[] = { 'F', 'L', 'Y' };
char letras[] = { 'A', 'R', 'T', 'T', 'E', 'C', 'H', '+' };
int rectW = 10;
int rectH = 10;

void setup()
{
  size(600, 1090);
  frameRate(30);
  
  Font1 = createFont("Impact", 18);
  Font2 = createFont("Achtung! Polizei", 18);
  img = loadImage("container.png");
  colorPixel = new color[width * height];
  


  loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      //pixels[loc] = img.pixels[loc];
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
  textFont(Font1);
  textSize(15);
  
  background(0);
  for (int x = 0; x < width; x = x + 10)
  {
    for (int y = 0; y < height; y = y + 15)
    {
      //fill(random(255), random(255), random(255));
      //rect(x * rectW, y * rectH, rectW, rectH);
      int loc = x + y * width;
      fill(colorPixel[loc]);
      int index = int(random(letras.length));
      text(letras[index], x, y);
    }
  }
  
  //TITLE
  fill(255, 222, 89);
  textFont(Font2);
  textSize(70);
  //textAlign(RIGHT);
  text("ARTE + TECNOLOGÍA", 50, 20, width-50, 400);
  
  //SUBTITLE
  fill(255);
  textFont(Font2);
  textSize(50);
  //textAlign(RIGHT);
  text("EVENTO TRANSDISCIPLINARIO", 20, height/2, width-50, 400);
  
  //noLoop();
  //saveFrame("poster.png");
}
