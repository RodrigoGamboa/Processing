//1923 X 712 PX
//int nums[] = {1, 2, 3, 4, 5};
//Rectangles myRect;
Rectangles[] myRects = new Rectangles[1000];

void setup() {
  //size(641, 237);
  //size(1000, 237);
  fullScreen();
  //println(nums[4]);
  //myRect = new Rectangles();
  for(int i = 0; i < myRects.length; i++) {
    myRects[i] = new Rectangles();
  }
}

void draw() {
  background(0);
  //myRect.display();
  //myRect.increase();
  for(int i = 0; i < myRects.length; i++) {
    myRects[i].display();
    myRects[i].increase();
  } 
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
  int maxWidthRect = int(random(height/3));
  int maxHeightRect = int(random(height/3));
  
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
