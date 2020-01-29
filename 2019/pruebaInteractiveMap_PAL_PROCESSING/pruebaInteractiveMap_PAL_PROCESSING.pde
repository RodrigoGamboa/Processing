//SERIAL LIBRARY
import processing.serial.*;

//SERIAL COMMUNICATION VARIABLES
int linefeed = 10; // new line ASCII = 10
Serial myPort;
int pot1_DATA = 0;
int pot2_DATA = 0;
int pot3_DATA = 0;
int pot4_DATA = 0;
int pot5_DATA = 0;
int pot6_DATA = 0;
int pot7_DATA = 0;
int pot8_DATA = 0;

float pot1_VALUE = 0.0;
float pot2_VALUE = 0.0;
float pot3_VALUE = 0.0;
float pot4_VALUE = 0.0;
float pot5_VALUE = 0.0;
float pot6_VALUE = 0.0;
float pot7_VALUE = 0.0;
float pot8_VALUE = 0.0;

//IMAGES VARIABLES
PImage merida_background;
PImage mapa_norte_activo, mapa_norte_inactivo, mapa_norte_shadow;
PImage mapa_centro_activo, mapa_centro_inactivo, mapa_centro_shadow;
PImage mapa_sur_activo, mapa_sur_inactivo, mapa_sur_shadow;
PImage mapa_poniente_activo, mapa_poniente_inactivo, mapa_poniente_shadow;
PImage mapa_oriente_activo, mapa_oriente_inactivo, mapa_oriente_shadow;

float offset = 100;
float offset_norte = 5;
float offset_oriente = 8;
float offset_centro = 30;
float offset_poniente = 2;
float offset_sur = 20;
int offset_shadow = 10;

void setup()
{
  //SERIAL COMMUNICATION VARIABLES 
  myPort =  new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(linefeed);

  //SIZE
  size(800, 700, P3D);
  //IMAGES
  merida_background = loadImage("merida_background.jpg");
  mapa_norte_activo = loadImage("mapa_norte_inactivo.png");
  mapa_norte_shadow = loadImage("mapa_norte_inactivo.png");
  mapa_norte_inactivo = loadImage("mapa_norte_inactivo.png");
  mapa_centro_activo = loadImage("mapa_centro_inactivo.png");
  mapa_centro_shadow = loadImage("mapa_centro_inactivo.png");
  mapa_centro_inactivo = loadImage("mapa_centro_inactivo.png");
  mapa_sur_activo = loadImage("mapa_sur_inactivo.png");
  mapa_sur_shadow = loadImage("mapa_sur_inactivo.png");
  mapa_sur_inactivo = loadImage("mapa_sur_inactivo.png");
  mapa_poniente_activo = loadImage("mapa_poniente_inactivo.png");
  mapa_poniente_shadow = loadImage("mapa_poniente_inactivo.png");
  mapa_poniente_inactivo = loadImage("mapa_poniente_inactivo.png");
  mapa_oriente_activo = loadImage("mapa_oriente_inactivo.png");
  mapa_oriente_shadow = loadImage("mapa_oriente_inactivo.png");
  mapa_oriente_inactivo = loadImage("mapa_oriente_inactivo.png");
  //RESIZING SHADOWS
  merida_background.resize(800, 700);
  mapa_norte_shadow.resize(mapa_norte_shadow.width + offset_shadow, 0);
  mapa_centro_shadow.resize(mapa_centro_shadow.width + offset_shadow, 0);
  mapa_sur_shadow.resize(mapa_sur_shadow.width + offset_shadow, 0);
  mapa_poniente_shadow.resize(mapa_poniente_shadow.width + offset_shadow, 0);
  mapa_oriente_shadow.resize(mapa_oriente_shadow.width + offset_shadow, 0);


  imageMode(CENTER);

  //TEXT
  textSize(12);
  textAlign(CENTER);
}

void draw()
{
  background(merida_background);

  //UPDATING VARIABLES
  offset_norte = pot1_VALUE;
  offset_oriente = pot2_VALUE;
  offset_centro = pot3_VALUE;
  offset_poniente = pot4_VALUE;
  offset_sur = pot5_VALUE;

  //NORTE
  //CONTORNO INFERIOR
  tint(0);  
  image(mapa_norte_activo, width/2 + 19, height/2 - 113);
  //SOMBRA
  for (int x = 1; x < offset_norte; x++)
  {
    image(mapa_norte_inactivo, width/2 + 19 + x, height/2 - 113 + x);
  }
  //ALTURA
  tint(75, 71, 29);
  for (int x = 1; x < offset_norte; x++)
  {
    image(mapa_norte_inactivo, width/2 + 19 + x, height/2 - 113 - x);
  }
  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_norte_shadow, width/2 + 19 + offset_norte, height/2 - 113 - offset_norte);
  tint(255, 239, 84);
  image(mapa_norte_activo, width/2 + 19 + offset_norte, height/2 - 113 - offset_norte);
  //TEXT
  text("NORTE", width/2 + 19 + offset_norte, height/2 - 113 - offset_norte);
  text(offset_norte, width/2 + 19 + offset_norte, height/2 - 113 - offset_norte + 20);

  //ORIENTE
  //CONTORNO INFERIOR
  tint(0);
  image(mapa_oriente_activo, width/2 + 66, height/2);
  //SOMBRA
  tint(0);
  for (int x = 1; x < offset_oriente; x++)
  {
    image(mapa_oriente_inactivo, width/2 + 66 + x, height/2 + x);
  }
  //ALTURA
  tint(20, 17, 70);
  for (int x = 1; x < offset_oriente; x++)
  {
    image(mapa_oriente_inactivo, width/2 + 66 + x, height/2 - x);
  }
  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_oriente_shadow, width/2 + 66 + offset_oriente, height/2 - offset_oriente);
  tint(93, 82, 247);
  image(mapa_oriente_activo, width/2 + 66 + offset_oriente, height/2 - offset_oriente);
  //TEXT
  text("ORIENTE", width/2 + 66 + offset_oriente, height/2 - offset_oriente);
  text(offset_oriente, width/2 + 66 + offset_oriente, height/2 - offset_oriente + 20);

  //CENTRO
  //CONTORNO INFERIOR
  tint(0);
  image(mapa_centro_activo, width/2, height/2);
  //SOMBRA
  /*for (int x = 1; x < offset_centro; x++)
  {
    image(mapa_centro_inactivo, width/2 + x, height/2 + x);
  }*/
  //ALTURA
  tint(57, 12, 55);
  for (int x = 1; x < offset_centro; x++)
  {
    image(mapa_centro_inactivo, width/2 + x, height/2 - x);
  }
  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_centro_shadow, width/2 + offset_centro, height/2 - offset_centro);
  tint(255, 129, 252);
  image(mapa_centro_activo, width/2 + offset_centro, height/2 - offset_centro);
  //TEXT
  text("CENTRO", width/2 + offset_centro, height/2 - offset_centro);
  text(offset_centro, width/2 + offset_centro, height/2 - offset_centro + 20);

  //PONIENTE
  //CONTORNO INFERIOR
  tint(0);
  image(mapa_poniente_activo, width/2 - 77, height/2 - 35);
  //SOMBRA
  /*for (int x = 1; x < offset_poniente; x++)
  {
    image(mapa_poniente_inactivo, width/2 - 77 + x, height/2 - 35 + x);
  }*/
  //ALTURA
  tint(17, 60, 34);
  for (int x = 1; x < offset_poniente; x++)
  {
    image(mapa_poniente_inactivo, width/2 - 77 + x, height/2 - 35 - x);
  }
  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_poniente_shadow, width/2 - 77 + offset_poniente, height/2 - 35 - offset_poniente);
  tint(98, 255, 161);
  image(mapa_poniente_activo, width/2 - 77 + offset_poniente, height/2 - 35 - offset_poniente);
  //TEXT
  text("PONIENTE", width/2 - 77 + offset_poniente, height/2 - 35 - offset_poniente);
  text(offset_poniente, width/2 - 77 + offset_poniente, height/2 - 35 - offset_poniente + 20);

  //SUR
  //CONTORNO INFERIOR
  tint(0);
  image(mapa_sur_activo, width/2 - 52, height/2 + 81);
  //SOMBRA
  for (int x = 1; x < offset_sur; x++)
  {
    image(mapa_sur_inactivo, width/2 - 52 + x, height/2 + 81 + x);
  }
  //ALTURA
  tint(140, 15, 15);
  for (int x = 1; x < offset_sur; x++)
  {
    image(mapa_sur_inactivo, width/2 - 52 + x, height/2 + 81 - x);
  }
  //CONTORNO SUPERIOR Y SUPERFICIE
  tint(0);
  image(mapa_sur_shadow, width/2 - 52 + offset_sur, height/2 + 81 - offset_sur);
  tint(255, 28, 28);
  image(mapa_sur_activo, width/2 - 52 + offset_sur, height/2 + 81 - offset_sur);
  //TEXT
  text("SUR", width/2 - 52 + offset_sur, height/2 + 81 - offset_sur);
  text(offset_sur, width/2 - 52 + offset_sur, height/2 + 81 - offset_sur + 20);

  //LÍNEAS
  /*
  stroke(255);
   for (int a = 0; a <= width*2; a = a + 10)
   {
   line(0, a, a, 0);
   }
   */
}

//SERIAL COMMUNICATION FUNCTION
void serialEvent (Serial myPort) 
{
  //READING SERIAL DATA
  String myString = myPort.readString();  // read serial buffer as string
  if (myString != null)                   // if we have any other bytes than linefeed
  {   
    myString = trim(myString);            // trim crap
    int inData = int(myString);
    if (inData < 1024)
    {
      pot1_DATA = inData;                         //0 | 1023
    } else if (inData >= 1024 && inData < 2048)
    {
      pot2_DATA = inData - 1024;                  //1024 | 2047
    } else if (inData >= 2048 && inData < 3072)
    {
      pot3_DATA = inData - 2048;                  //2048 | 3071
    } else if (inData >= 3072 && inData < 4096)
    {
      pot4_DATA = inData - 3072;                   //3072 | 4095
    } else if (inData >= 4096 && inData < 5120)
    {
      pot5_DATA = inData - 4096;                   //4096 | 5119
    } else if (inData >= 5120 && inData < 6144)
    {
      pot6_DATA = inData - 5120;                   //5120 | 6143
    } else if (inData >= 6144 && inData < 7168)
    {
      pot7_DATA = inData - 6144;                   //6144 | 7167
    } else if (inData >= 7168 && inData < 8192)
    {
      pot8_DATA = inData - 7168;                   //7168 | 8191
    }
  }

  //ADAPTING DATA
  /*
  if (pot1_DATA < 15)
   {
   pot1_DATA = 0;
   }
   if (pot8_DATA < 15)
   {
   pot8_DATA = 0;
   }
   */

  //CONVERTING THE SERIAL DATA
  pot1_VALUE = map(pot1_DATA, 0, 1023, 0, 100);
  pot2_VALUE = map(pot2_DATA, 0, 1023, 0, 100);
  pot3_VALUE = map(pot3_DATA, 0, 1023, 0, 100);
  pot4_VALUE = map(pot4_DATA, 0, 1023, 0, 100);
  pot5_VALUE = map(pot5_DATA, 0, 1023, 0, 100);
  pot6_VALUE = map(pot6_DATA, 0, 1023, 0, PI/2);
  pot7_VALUE = map(pot7_DATA, 0, 1023, 0, PI/2);
  pot8_VALUE = map(pot8_DATA, 0, 1023, 0, PI/2);
}