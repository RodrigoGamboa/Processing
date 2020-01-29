//Export Video
//From Tim Rodenbroeker tutorial
//Ref: https://timrodenbroeker.de/processing-tutorial-video-export/

// import the library
import com.hamoid.*;

// create a new VideoExport-object
VideoExport videoExport;

void setup() {
  ...
  // Some settings
  videoExport = new VideoExport(this, "myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}
void draw() {
  ...
  // Save a frame!
  videoExport.saveFrame();
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
