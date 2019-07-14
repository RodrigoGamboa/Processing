PImage mapa_norte_activo, mapa_norte_inactivo;
PImage mapa_centro_activo, mapa_centro_inactivo;
PImage mapa_sur_activo, mapa_sur_inactivo;
PImage mapa_poniente_activo, mapa_poniente_inactivo;
PImage mapa_oriente_activo, mapa_oriente_inactivo;

float offset = 100;
float offset_norte = 50;
float offset_oriente = 10;
float offset_centro = 50;
float offset_poniente = 20;
float offset_sur = 30;

void setup()
{
  size(500, 500);

  mapa_norte_activo = loadImage("mapa_norte_activo.png");
  mapa_norte_inactivo = loadImage("mapa_norte_inactivo.png");
  mapa_centro_activo = loadImage("mapa_centro_activo.png");
  mapa_centro_inactivo = loadImage("mapa_centro_inactivo.png");
  mapa_sur_activo = loadImage("mapa_sur_activo.png");
  mapa_sur_inactivo = loadImage("mapa_sur_inactivo.png");
  mapa_poniente_activo = loadImage("mapa_poniente_activo.png");
  mapa_poniente_inactivo = loadImage("mapa_poniente_inactivo.png");
  mapa_oriente_activo = loadImage("mapa_oriente_activo.png");
  mapa_oriente_inactivo = loadImage("mapa_oriente_inactivo.png");
}

void draw()
{
  background(0, 0, 255);
  imageMode(CENTER);

  //CONTORNO INFERIOR
  tint(0);  
  image(mapa_norte_activo, width/2 + 19, height/2 - 113);
  image(mapa_oriente_activo, width/2 + 66, height/2);
  image(mapa_centro_activo, width/2, height/2);
  image(mapa_poniente_activo, width/2 - 77, height/2 - 35);
  image(mapa_sur_activo, width/2 - 52, height/2 + 81);

  //ALTURAS
  tint(41, 0, 0);
  for (int x = 1; x < offset_norte; x++)
  {
    image(mapa_norte_inactivo, width/2 + 19 + x, height/2 - 113 - x);
  }
  for (int x = 1; x < offset_oriente; x++)
  {
    image(mapa_oriente_inactivo, width/2 + 66 + x, height/2 - x);
  }
  for (int x = 1; x < offset_centro; x++)
  {
    image(mapa_centro_inactivo, width/2 + x, height/2 - x);
  }
  for (int x = 1; x < offset_poniente; x++)
  {
    image(mapa_poniente_inactivo, width/2 - 77 + x, height/2 - 35 - x);
  }
  for (int x = 1; x < offset_sur; x++)
  {
    image(mapa_sur_inactivo, width/2 - 52 + x, height/2 + 81 - x);
  }


  //LÍNEAS
  for (int x = 10; x < width; x = x + 30)
  {
    for (int y = 10; y < height; y = y + 30)
    {
      stroke(0, 0, 255);
      line(0, y, x, 0);
      line(height, y, x, width);
    }
  }

  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_norte_activo, width/2 + 19 + offset_norte, height/2 - 113 - offset_norte);
  noTint();
  image(mapa_norte_activo, width/2 + 19 + offset_norte + 1, height/2 - 113 - offset_norte - 1);

  tint(0);
  image(mapa_oriente_activo, width/2 + 66 + offset_oriente, height/2 - offset_oriente);
  noTint();
  image(mapa_oriente_activo, width/2 + 66 + offset_oriente + 1, height/2 - offset_oriente - 1);

  tint(0);
  image(mapa_centro_activo, width/2 + offset_centro, height/2 - offset_centro);
  noTint();
  image(mapa_centro_activo, width/2 + offset_centro + 1, height/2 - offset_centro + 1);

  tint(0);
  image(mapa_poniente_activo, width/2 - 77 + offset_poniente, height/2 - 35 - offset_poniente);
  noTint();
  image(mapa_poniente_activo, width/2 - 77 + offset_poniente + 1, height/2 - 35 - offset_poniente + 1);

  tint(0);
  image(mapa_sur_activo, width/2 - 52 + offset_sur, height/2 + 81 - offset_sur);
  noTint();
  image(mapa_sur_activo, width/2 - 52 + offset_sur + 1, height/2 + 81 - offset_sur + 1);
}