//Ejemplo de OSC con Processing conectado a la app Syntien (iOS).
//Referencia 1: https://practice2145.wordpress.com/2017/04/23/using-osc-to-receive-android-accelerometer-data/
//Referencia 2: https://github.com/zhenzhenqi/androidSensorOsc/blob/master/androidSensorOsc.pde
//Se coloca la ip de la laptop en la app (Ejemplo: 192.168.0.10, esta es la IPv4 de la compu)
//Para conocer la IP de tu computadora: https://www.hellotech.com/guide/for/how-to-find-ip-address-on-mac)

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float touchpadX, touchpadY;

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
  rotate(radians(touchpadX*100)); //Utilizando touchpadX para la rotación del cuadrado.
  rect(0, 0, map(touchpadY, 0, 1, 1, width), map(touchpadY, 0, 1, 1, width));  //Utilizando touchpadY para el tamaño del cuadrado.
  popMatrix();

  fill(0, 10);
  rect(width/2, height/2, width, height);
}


void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/syntien/touchpad/1/touchpad1/press")==true) {
    touchpadX = theOscMessage.get(0).floatValue();  
    println("touchpadX: "+touchpadX);
    touchpadY = theOscMessage.get(1).floatValue();  
    println("touchpadY: "+touchpadY);
  }
}
