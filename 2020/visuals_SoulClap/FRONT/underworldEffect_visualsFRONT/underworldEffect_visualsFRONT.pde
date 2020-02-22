import processing.video.*;
Capture video;

//CHANGE THIS!
float cameraW = 640;
float cameraH = 360;
float timeInterval = 0.05; //The less the faster!
int xTimes = 6;  //Número de columnas
int yTimes = 3;  //Número de filas
//----------

float cameraRatio = cameraW/cameraH;
int timeTracker = 0;
  //Tiempo de intervalo en segundos
int timeFlag = 0;
int x, y = 0;
int videoWidth = 0;
int videoHeight = 0;
//int frameSize = 0;

void setup() {
  noCursor();
  //size(641, 237);
  size(1923, 712);
  //println(cameraRatio);
  String[] cameras = Capture.list();
  //video = new Capture(this, width/2, height/2);
  video = new Capture(this, cameras[3]);
  video.start();
  timeTracker = millis();

  //videoWidth = width;
  //videoHeight = height;
}

void mousePressed() {
  if (timeFlag == 0) {
    timeFlag = 1;
  } else {
    timeFlag = 0;
  }
}

void captureEvent(Capture Event) {
}

void draw() {
  if (timeFlag == 1 && millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    video.read();
    //tint(random(255), random(255), random(255));
    imageMode(CORNER);
    //image(video, (width/xTimes)*x, (height/yTimes)*y, width/xTimes, height/yTimes);
    image(video, (width/xTimes)*x, (height/yTimes)*y, (height/yTimes)*cameraRatio, height/yTimes);
    x++;
    if (x >= xTimes) {
      x = 0;
      y++;
      if (y >= yTimes) {
        y = 0;
        //timeFlag = 0;
      }
    }
  } else if (timeFlag == 0) {
    video.read();
    imageMode(CENTER);
    image(video, width/2, height/2, height*cameraRatio, height);
  }
  fill(0, 10);
  rect(0, 0, width, height);
}
