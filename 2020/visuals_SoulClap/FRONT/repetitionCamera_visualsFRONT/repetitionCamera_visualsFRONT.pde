import processing.video.*;

Capture video;
//CHANGE THIS!
float cameraW = 640;
float cameraH = 360;
int xTimes = 3;  //Número de columnas
int yTimes = 2;  //Número de filas
//-----------

float cameraRatio = cameraW/cameraH;
int timeTracker = 0;
float timeInterval = 1; 
int x, y = 0;
int index = 0;
PImage[] frames;
int frame_count = 5;

void captureEvent(Capture video) {
  video.read();
  PImage p = video;
  if (millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    frames[index] = p.copy();
  }
  index += 1;
  if (index == frame_count) {
    index = 0;
  }
}

void setup() {
  //size(641, 237);
  //size(962, 356);
  size(1923, 712);
  background(255, 1, 154);
  timeTracker = millis();
  String[] cameras = Capture.list();
  video = new Capture(this, cameras[3]);
  video.start();
  frames = new PImage[frame_count];
  for (int i = 0; i < frame_count; i++) {
    frames[i] = createImage(0, 0, 0);
  }
}

void draw() {
  showVideo();
}

void showVideo() {
  
  for (int i = 0; i < frame_count; i++) {
    image(frames[(index+i)%frame_count], (width/xTimes)*x, (height/yTimes)*y, (height/yTimes)*cameraRatio, height/yTimes);
    stroke(255, 1, 154);
    rect((width/xTimes)*x, (height/yTimes)*y, (height/yTimes)*cameraRatio, height/yTimes);
  }
  x++;
  if (x >= xTimes) {
    x = 0;
    y++;
    if (y >= yTimes) {
      y = 0;
      //timeFlag = 0;
    }
  }
  noFill();
  stroke(255, 1, 154);
  for (int i = 0; i < 5; i++) {
    rect(random(width), random(height), random(10, 100), random(10, 100));
  }
}
