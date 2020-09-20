//Ejemplo de OSC con Processing conectado a la app oscHook (Android).
//Fuente 1: https://practice2145.wordpress.com/2017/04/23/using-osc-to-receive-android-accelerometer-data/
//Fuente 2: https://github.com/zhenzhenqi/androidSensorOsc/blob/master/androidSensorOsc.pde
//Se coloca la ip de la laptop en la app (Ejemplo: 192.168.0.10, esta es la IPv4 de la computadora)
//Para conocer la IP de tu computadora: https://www.hellotech.com/guide/for/how-to-find-ip-address-on-mac)

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float accelX, accelY, accelZ;

void setup() {
  size(500, 500);
 
  oscP5 = new OscP5(this, 7400);
  
  rectMode(CENTER);
  noStroke();
}


void draw() {
  float time = float(millis())/300;
  fill(map(sin(time), -1, 1, 127, 255));
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(accelX*10));  //Utilizando accelX para la rotación del cuadrado.
  rect(0, 0, map(accelY, -11, 11, 1, width), map(accelY, -11, 11, 1, width));  //Utilizando accelY para el tamaño del cuadrado.
  popMatrix();

  fill(map(accelZ, -11, 11, 0, 127), 10);  //Utilizando accelZ para el color del fondo.
  rect(width/2, height/2, width, height);
}


void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/accelerometer/raw/x")==true) {
    accelX = theOscMessage.get(0).floatValue();  
    println("x: "+accelX);
  }

  if (theOscMessage.checkAddrPattern("/accelerometer/raw/y")==true) {
    accelY = theOscMessage.get(0).floatValue();  
    println("y: "+accelY);
  }

  if (theOscMessage.checkAddrPattern("/accelerometer/raw/z")==true) {
    accelZ = theOscMessage.get(0).floatValue();  
    println("z: "+accelZ);
  }
}
