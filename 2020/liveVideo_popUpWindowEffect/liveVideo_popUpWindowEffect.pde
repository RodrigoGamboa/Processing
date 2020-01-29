import processing.video.*;

Capture video;
PImage videoCut;
int ranX, ranY = 0;
int ranW, ranH = 0;
color buttonR =  #FF605C;
color buttonY = #FFBD44;
color buttonG = #00CA4E;

void setup() {
  //fullScreen();
  size(480, 360);
  video = new Capture(this, width, height);
  video.start();
  noStroke();
}

void captureEvent(Capture Event) {
  video.read();
}

void draw() {
  display();
}

void display() {
  background(0);   
  //videoCut = video.get(ranX, ranY, ranW, ranH);
  //image(videoCut, ranX, ranY, ranW, ranH);
  videoCut = video.get(mouseX, mouseY, ranW, ranH);
  image(videoCut, mouseX, mouseY, ranW, ranH);
  fill(190);
  stroke(150, 125);
  //rect(ranX, ranY-20, ranW, 20, 5, 5, 0, 0);
  rect(mouseX, mouseY-20, ranW, 20, 5, 5, 0, 0);
  ellipseMode(CENTER);
  fill(buttonR);
  stroke(200, 0, 0);
  //ellipse(ranX+15, ranY-10, 11, 11);
  ellipse(mouseX+15, mouseY-10, 11, 11);
  fill(buttonY);
  stroke(255, 127, 80);
  //ellipse(ranX+35, ranY-10, 11, 11);
  ellipse(mouseX+35, mouseY-10, 11, 11);
  fill(buttonG);
  stroke(0, 127, 0);
  //ellipse(ranX+55, ranY-10, 11, 11);
  ellipse(mouseX+55, mouseY-10, 11, 11);
}

void mouseClicked() {
  //ranX = int(random(width));
  //ranY = int(random(height));
  ranX = mouseX;
  ranY = mouseY;
  ranW = int(random(ranX, width)); 
  ranH = int(random(ranY, height));
}
