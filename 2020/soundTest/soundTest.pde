  import processing.sound.*;
SoundFile file1;
SoundFile file2;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file1 = new SoundFile(this, "1.mp3");
  file2 = new SoundFile(this, "2.mp3");
  //file1.play();
  //file2.loop();
}      

void draw() {
  if(mouseX > width/2 && !file1.isPlaying()) {
    file1.play();
  }
  if(mouseY > height/2 && !file2.isPlaying()) {
    file2.play();
  }
  
}
