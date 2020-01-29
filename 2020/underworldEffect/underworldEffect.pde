import processing.video.*;

Capture video;
int timeTracker = 0;
float timeInterval = 0.1;  //Tiempo de intervalo en segundos
int timeFlag = 0;

int x, y = 0;
int xTimes = 5;
int yTimes = 5;

int videoWidth = 0;
int videoHeight = 0;
//int frameSize = 0;

void setup() {
  noCursor();
  fullScreen();
  //size(480, 360);
  video = new Capture(this, width/2, height/2);
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
    image(video, (width/xTimes)*x, (height/yTimes)*y, width/xTimes, height/yTimes);
    x++;
    if (x >= xTimes) {
      x = 0;
      y++;
      if (y >= yTimes) {
        y = 0;
        //timeFlag = 0;
      }
    }
  } else if(timeFlag == 0) {
    video.read();
    imageMode(CENTER);
    image(video, width/2, height/2, width/2, height/2);
  }
  fill(0, 10);
  rect(0, 0, width, height);
}
