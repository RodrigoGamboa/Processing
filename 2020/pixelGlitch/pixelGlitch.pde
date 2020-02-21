int numX = 100;
int numY = 100;
float randomColor = 0;
float timeTracker = 0;
float timeInterval = 0.2;

void setup() {
  //fullScreen();
  size(500, 500); 
  noStroke();
  timeTracker = millis();
}

void keyReleased() {
}

void draw() {
  if (millis() - timeTracker > timeInterval*1000) {
    timeTracker = millis();

    //Start of Timed code
    for (int y = 0; y < numX; y++) {
      for (int x = 0; x < numY; x++) {
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
