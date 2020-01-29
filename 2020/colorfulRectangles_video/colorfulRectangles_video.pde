import com.hamoid.*;

VideoExport videoExport;
Rectangles[] myRects = new Rectangles[10000];

void setup() {
  size(1080, 1920);
  for(int i = 0; i < myRects.length; i++) {
    myRects[i] = new Rectangles();
  }
  videoExport = new VideoExport(this, "myVideo3.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  background(0);
  for(int i = 0; i < myRects.length; i++) {
    myRects[i].display();
    myRects[i].increase();
  } 
  videoExport.saveFrame();
}

//Constructor
class Rectangles {
  int x = int(random(width));
  int y = int(random(height));
  color c = int(random(255));
  color r = int(random(255));
  color g = int(random(255));
  color b = int(random(255));
  int inc = 1;
  int widthRect = 0;
  int heightRect = 0;
  int maxWidthRect = int(random(width/5));
  int maxHeightRect = int(random(height/5));
  
  void display() {
    rectMode(CENTER);
    fill(r, g, b);
    noStroke();
    rect(x + random(-1, 1), y + random(-1, 1), widthRect, heightRect);
  }
  
  void increase() {
    widthRect = widthRect + inc;
    heightRect = heightRect + inc;
    if(widthRect > maxWidthRect) {
      widthRect = 0;
    }
    if(heightRect > maxHeightRect) {
      heightRect = 0;
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
