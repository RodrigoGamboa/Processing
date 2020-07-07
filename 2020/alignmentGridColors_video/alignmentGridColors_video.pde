import com.hamoid.*;

VideoExport videoExport;

int tilesCount = 1;
int sizeW, sizeH;
int cap;
int colorRan;
color colorStroke, colorFill;
boolean record = false;

void setup() {
  size(960, 960);
  colorMode(HSB, 360, 100, 100);
  frameRate(3);
  colorRan = int(random(255));

  videoExport = new VideoExport(this, "myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  background(360);
  tilesCount = int(map(mouseY, 0, height, 1, 50))+1;
  sizeW = width/tilesCount;
  sizeH = height/tilesCount;
  strokeWeight(map(mouseX, 0, width, 0, 350/tilesCount));
  strokeCap(cap);
  for (int i = 0; i < tilesCount+5; i++) {
    for (int j = 0; j < tilesCount+5; j++) {
      int toggle = int(random(2));
      int colorToggle = int(random(2));

      if (colorToggle == 0) {
        colorStroke = color(colorRan, 100, 100);
        colorFill = color(255-colorRan, 100, 100);
      }
      if (colorToggle == 1) {   
        colorStroke = color(255-colorRan, 100, 100);
        colorFill = color(colorRan, 100, 100);
      }
      noStroke();
      fill(colorFill);
      rect(sizeW*i, sizeH*j, sizeW, sizeH);

      stroke(colorStroke);
      if (toggle == 0) {
        line(sizeW*i, sizeH*j, sizeW*i + sizeW, sizeH*j + sizeH);
      }
      if (toggle == 1) {
        line(sizeW*i, sizeH*j + sizeH, sizeW*i + sizeW, sizeH*j);
      }
    }
  }
  
  //Guardando manualmente cada frame
  //saveFrame("data/frame_####.png");
  
  //Uso de librería Video Export
  /*
  if (record == true) {
    videoExport.saveFrame();
    println("Comienza la grabación.");
  }
  */
}

void keyReleased() {
  if (key == '1') cap = ROUND;
  if (key == '2') cap = SQUARE;
  if (key == '3') cap = PROJECT;
  if (key == '4') colorRan = int(random(255));
  if (key == 'r') record = true;
  if (key == 'q') {
    videoExport.endMovie();
    record = false;
    println("Termina la grabación.");
  }
}
