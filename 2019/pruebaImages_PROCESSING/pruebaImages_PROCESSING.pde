PImage img, imgShadow;


void setup()
{
  size(800, 500);
  background(255);
  img = loadImage("mapa_norte_activo.png");
  imgShadow = loadImage("mapa_norte_activo.png");
  imgShadow.resize(img.width + 5, 0);
  imageMode(CENTER);
}

void draw()
{
  tint(0);
  image(imgShadow, width/2, height/2);
  noTint();
  image(img, width/2, height/2);
}