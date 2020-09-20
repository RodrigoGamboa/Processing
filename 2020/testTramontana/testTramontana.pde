/****
 Tramontana for Processing
 Tramontana is a tool for interactive spaces. It communicates with iOS devices. You can download the app here: https://itunes.apple.com/us/app/tramontana/id1121069555?mt=8
 made by Pierluigi Dalla Rosa
 
 B_ChangeColor
 With this sketch you can change the color of your device. 
 
 Don't forget to change the ipAddress below (192.168.1.17) to match the one visible on your device when you open the app.
 ***/

///IMPORT TRAMONTANA
import tramontana.library.*;

///Tramontana needs websockets that can be found at:
///https://github.com/alexandrainst/processing_websockets
import websockets.*;

/* Create an instance of Tramonana */
Tramontana t;
String img;

void setup() {
  size(480, 240);

  /* Start the connection with Tramontana iOS/AppleTV/Android */
  /* Look on your device for the ipAddress, it shows on the starting panel when you open the app */
  t = new Tramontana(this, "192.168.0.3");
  img = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Circle-red.svg/1200px-Circle-red.svg.png";
}
void draw() {
  background(255);
  fill(255, 128, 128);
  noStroke();
}

void mousePressed() {  
  t.setColor(int(map(mouseX, 0, width, 0, 255)), int(map(mouseY, 0, height, 0, 255)), 255, 255);
  t.showImage(img);
}
