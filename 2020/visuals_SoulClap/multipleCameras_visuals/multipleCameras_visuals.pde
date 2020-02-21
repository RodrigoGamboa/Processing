import processing.video.*;

Capture cam1, cam2;
int count = 0;

void setup() {
  size(560, 180);
  String[] cameras = Capture.list();
  //Con las cámaras taika: Both cameras [15][27] at 640x480 resolution
  cam1 = new Capture(this, cameras[6]); //320x180, fps=30
  cam2 = new Capture(this, cameras[24]); //240x135, fps=30
  cam1.start();
  cam2.start();
}

void draw() {
  background(0);
  if(count == 0) {
  //image(cam1, 0, 0, width, height);
  } else {
  //image(cam2, 0, 0, width, height);
  }
  image(cam1, 0, 0, 320, 180);
  image(cam2, 320, 0, 320+240, 135);
}

void captureEvent(Capture Event) {  
  if(Event == cam1) {
    cam1.read();
  } else if(Event == cam2) {
    cam2.read();
  } 
}

void mousePressed() {
  if(count == 0) {
    count = 1;
  } else {
    count = 0;
  }
}
