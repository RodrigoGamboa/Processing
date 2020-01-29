//int nums[] = {1, 2, 3, 4, 5};
//Rectangles myRect;
Rectangles[] myRects = new Rectangles[100];
//int i = 0;

void setup() {
  //size(500, 500);
  //fullScreen();
  size(540, 960);
  //println(nums[4]);
  //myRect = new Rectangles();
  for(int i = 0; i < myRects.length; i++) {
    myRects[i] = new Rectangles();
  }
}

void mousePressed() {
  //myRects.append = new Rectangles();
  //myRects[i] = new Rectangles();
  //i++;
}

void draw() {
  //background(0);
  //myRect.display();
  //myRect.increase();
  for(int i = 0; i < myRects.length; i++) {
    myRects[i].display();
    myRects[i].increase();
  }
  rectMode(CORNER);
  fill(0, 10);
  rect(0, 0, width, height);
  //saveFrame("output/void_####.png");
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
    //fill(r, g, b);
    noFill();
    stroke(random(255), random(255));
    //noStroke();
    //rect(x + random(-1, 1), y + random(-1, 1), widthRect, heightRect);
    ellipse(x + random(-1, 1), y + random(-1, 1), widthRect, heightRect);
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
