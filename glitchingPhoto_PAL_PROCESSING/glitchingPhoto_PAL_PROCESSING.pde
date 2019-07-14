
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

PImage img;

void setup()
{
  size(560, 440);
  //SERIAL COMMUNICATION VARIABLES 
  myPort =  new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(linefeed);
  
  img = loadImage("Bacalar.jpg");
}

void draw()
{
  //image(img, 0, 0);
  loadPixels();
  img.loadPixels();
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      //pixels[loc] = color(r/2, g, b);
      pixels[loc] = img.pixels[loc]+int(pot1_VALUE);
    }
  }
  updatePixels();
  println(pot1_VALUE);
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
  pot1_VALUE = map(pot1_DATA, 0, 1023, -500, 500);
  pot2_VALUE = map(pot2_DATA, 0, 1001, 0, 0.5);
  pot3_VALUE = map(pot3_DATA, 11, 1001, 1, 2.5);
  pot4_VALUE = map(pot4_DATA, 0, 1023, 0, 1);
  pot5_VALUE = map(pot5_DATA, 0, 1023, 0, 7);
  pot6_VALUE = map(pot6_DATA, 11, 1001, -0.5, 0.5);
  pot7_VALUE = map(pot7_DATA, 11, 1001, -0.5, 0.5);
  pot8_VALUE = map(pot8_DATA, 0, 1023, 0, 5);
}
