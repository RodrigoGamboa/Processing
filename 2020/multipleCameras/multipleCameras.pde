import processing.video.*;

Capture cam1, cam2;
int count = 0;

void setup() {
  size(500, 500);
  String[] cameras = Capture.list();
  cam1 = new Capture(this, cameras[0]);
  cam2 = new Capture(this, cameras[15]);
  cam1.start();
  cam2.start();
}

void draw() {
  background(0);
  if(count == 0) {
  image(cam1, 0, 0, width/2, height/2);
  } else {
  image(cam2, 0, 0, width/2, height/2);
  }
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
