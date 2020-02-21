//CHANGE THIS!
float numX = 10;
float timeInterval = 0.05;
//----------

float numY = 0;  //numY = numX*3
float randomColor = 0;
float timeTracker = 0;


void setup() {
  //size(641, 237);
  size(297, 712);
  numY = numX*3;
  noStroke();
  timeTracker = millis();
}

void keyReleased() {
}

void draw() {
  if (millis() - timeTracker > timeInterval*1000) {
    timeTracker = millis();

    //Start of Timed code
    for (int y = 0; y < numY; y++) {
      for (int x = 0; x < numX; x++) {
        randomColor = random(0, 1);
        //println(randomColor);
        if (randomColor > 0.5) {
          fill(255);
        } else {
          fill(0);
        }
        rect(x*((width)/numX), y*((height)/numY), width/numX, height/numY);
      }
    }
    //End of Timed code
  }
}
