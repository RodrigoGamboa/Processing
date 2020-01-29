PImage img1, img2;
int bandera = 0;

void setup()
{
  size(800, 500);
  img1 = loadImage("pruebapng1.png");
  img2 = loadImage("pruebapng2.png");
}

void draw()
{
  background(0);
  if(bandera == 0)
  {
    image(img1, 0, 0);
  }
  else if (bandera == 1)
  {
    image(img2, 0, 0);
  }
  
}

void mousePressed()
{ 
  if( (mouseX >= 0 && mouseX <= 256) && (mouseY > 0 && mouseY < 256) ) 
  { 
      bandera = 1;
  } else
  {
    bandera = 0;
  }
} 