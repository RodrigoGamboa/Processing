import processing.serial.*;
 
int linefeed = 10; // new line ASCII = 10
Serial myPort;
 
int value1 = 0; //this variable will contain the reading
void setup () 
{
  size(500, 500);
  // change port!
  myPort =  new Serial(this, Serial.list()[2], 9600);
  // here we're saying that we need to buffer until 'NEW LINE'
  myPort.bufferUntil(linefeed);
  noStroke();
}
 
void draw () 
{ 
  float time = float(millis())/500;
  for(int i = 0; i < 100; i++) {
  fill(255*sin(i*0.01*time), 255*sin(i*0.012*time), 255*sin(i*0.013*time));
  ellipse(width/2, height/2, value1, value1);
  }
}
 
void serialEvent (Serial myPort) 
{
  // read serial buffer as string
  String myString = myPort.readString();
 
  // if we have any other bytes than linefeed
  if (myString != null) 
  {
    // trim crap
    myString = trim(myString);
    value1 = int(myString); //make string to integer
    println(value1);
  }
}





/*

//  Código de Arduino

  //AnalogReadSerial
  //Reads an analog input on pin 0, prints the result to the serial monitor.
  //Graphical representation is available using serial plotter (Tools > Serial Plotter menu)
  //Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.
  //
  //This example code is in the public domain.

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:
  int sensorValue1 = analogRead(A0);
  int sensorValue2 = analogRead(A1);
  int sensorValue3 = analogRead(A2);
  int sensorValue4 = analogRead(A3);
  // print out the value you read:
  //Serial.println(sensorValue1);
  //Serial.println(sensorValue2 + 1024);
  Serial.println(sensorValue3 + 2048);
  //Serial.println(sensorValue4 + 3072);
  delay(1);        // delay in between reads for stability
}

*/
