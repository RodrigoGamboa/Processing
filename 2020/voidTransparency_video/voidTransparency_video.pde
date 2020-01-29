import com.hamoid.*;

VideoExport videoExport;
Rectangles[] myRects = new Rectangles[100];

void setup() {
  size(540, 960);
  for (int i = 0; i < myRects.length; i++) {
    myRects[i] = new Rectangles();
  }
  videoExport = new VideoExport(this, "output/myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  for (int i = 0; i < myRects.length; i++) {
    myRects[i].display();
    myRects[i].increase();
  }
  rectMode(CORNER);
  fill(0, 10);
  rect(0, 0, width, height);
  saveFrame("output/void_####.png");
  videoExport.saveFrame();
}

//Constructor
class Rectangles {
  int x = width/2;
  int y = height/2;
  color c = int(random(255));
  color r = int(random(255));
  color g = int(random(255));
  color b = int(random(255));
  int inc = 1;
  int widthRect = 0;
  int heightRect = 0;
  //int maxWidthRect = int(random(width/5));
  //int maxHeightRect = int(random(height/5));
  int rand = int(random(width));
  int maxWidthRect = rand;
  int maxHeightRect = rand;

  void display() {
    rectMode(CENTER);
    noFill();
    stroke(random(255), random(255));
    ellipse(x + random(-1, 1), y + random(-1, 1), widthRect, heightRect);
  }

  void increase() {
    widthRect = widthRect + inc;
    heightRect = heightRect + inc;
    if (widthRect > maxWidthRect) {
      widthRect = 0;
    }
    if (heightRect > maxHeightRect) {
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
