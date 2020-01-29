import processing.video.*;
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
int pot3_VALUE = 0;
int pot4_VALUE = 0;
int pot5_VALUE = 0;
float pot6_VALUE = 0.0;
float pot7_VALUE = 0.0;
float pot8_VALUE = 0.0;


Movie movie;
color pink = color(255, 102, 204);
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color colorPixel;
float colorR, colorG, colorB;
int val = 0;
int countPixels = 0;

void setup()
{
  //SERIAL COMMUNICATION VARIABLES 
  myPort =  new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(linefeed);
  
  size(480, 480);
  //frameRate(30);
  movie = new Movie(this, "sheep.mp4");
  movie.loop();
  movie.volume(0);
}

void draw()
{
  //movie.width*movie.height  //auto
  //movie.width * val  //con flechas
  movie.loadPixels();
  for (int i = 0; i < movie.width*val; i++)
  {
    colorR = red(movie.pixels[i]);
    colorG = green(movie.pixels[i]);
    colorB = blue(movie.pixels[i]);
    
    if (colorR < pot3_VALUE && colorG < pot4_VALUE && colorB < pot5_VALUE)
    {
      
      movie.pixels[i] = black; //Fondo negro
      //movie.pixels[i] = color(colorR, 0, 0);  //Filtro rojo
    } else
    {
      movie.pixels[i] = white;
      //movie.pixels[i]  = color(random(0, 255), 0, 0);
    }
  }
  println(pot3_VALUE, pot4_VALUE, pot5_VALUE);
  movie.updatePixels();

  image(movie, 0, 0);
}

void movieEvent(Movie movie)
{
  movie.read();
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == DOWN) 
    {
      val++;
      if (val > movie.height)
      {
        val = movie.height;
      }
    } else if (keyCode == UP) 
    {
      val--;
      if (val < 0)
      {
        val = 0;
      }
    } else if (keyCode == LEFT)
    {
      val = 0;
    } else if (keyCode == RIGHT)
    {
      val = movie.height;
    }
  } else {
  }
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
  pot1_VALUE = map(pot1_DATA, 0, 1005, 0, 4);
  pot2_VALUE = map(pot2_DATA, 0, 1001, 0, 0.5);
  pot3_VALUE = int(map(pot3_DATA, 0, 1023, 0, 255));
  pot4_VALUE = int(map(pot4_DATA, 0, 1023, 0, 255));
  pot5_VALUE = int(map(pot5_DATA, 0, 1023, 0, 255));
  pot6_VALUE = map(pot6_DATA, 11, 1001, -0.5, 0.5);
  pot7_VALUE = map(pot7_DATA, 11, 1001, -0.5, 0.5);
  pot8_VALUE = map(pot8_DATA, 0, 1023, 0, 5);
}