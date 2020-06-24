import com.hamoid.*;

VideoExport videoExport;

void setup() {
  size(1080, 1920);
  //fullScreen();
  background(0);
  //translate(width/2, height/2);
  videoExport = new VideoExport(this, "myVideo3.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  noFill();
  int ang = 0;
  //float x = width/2;
  //float y = height/2;
  float x = random(width);
  float y = random(height);

  translate(x, y);
  for (int i=0; i < 500; i++) {
    stroke(random(255));
    rotate(radians(ang));
    //rect(-25, -25, 50, 50);
    line(random(100), random(100), 0, 0);
    ang++;
    if (radians(ang) > PI) {
      ang = 0;
    }
  }
  //INCOMPLETO: Colocar la elipse en el centro
  /*
  noStroke();
   fill(0);
   ellipse(mouseX, mouseY, 8, 8);
   */
   videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
