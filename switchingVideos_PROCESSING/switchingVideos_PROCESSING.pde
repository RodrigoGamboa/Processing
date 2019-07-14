//switchingVideos_PROCESSING by Rodrigo Gamboa.
//Create a "data" folder inside this Processing sketch folder (if doesn't have it yet).
//Paste the video files inside the data folder.
//Change this code following the comments guides.

//VIDEO LIBRARY
import processing.video.*;

//VIDEO VARIABLES
Movie video1, video2, video3, video4;

int cont = 0;

void setup() {
  size(500, 500);
  background(0);
  
  //VIDEO VARIABLES
  video1 = new Movie(this, "policias.mp4");  //Change the "name.mp4" to your file
  video2 = new Movie(this, "machine.mp4");  //Change the "name.mp4" to your file
  video3 = new Movie(this, "oneboard.mp4");  //Change the "name.mp4" to your file
  video4 = new Movie(this, "twoboards.mp4");  //Change the "name.mp4" to your file
}

void draw() {
  //background(val);
  if (cont == 0) {
    background(0);
  } else if (cont == 1)
  {
    video2.stop();
    video3.stop();
    video4.stop();
    background(0);
    video1.play();
    image(video1, 0, 0, width, height);
  } else if (cont == 2)
  {
    video1.stop();
    video3.stop();
    video4.stop();
    background(0);
    video2.play();
    image(video2, 0, 0, width, height);
  } else if (cont == 3)
  {
    video1.stop();
    video2.stop();
    video4.stop();
    background(0);
    video3.play();
    image(video3, 0, 0, width, height);
  } else if (cont == 4)
  {
    video1.stop();
    video2.stop();
    video3.stop();
    background(0);
    video4.play();
    image(video4, 0, 0, width, height);
  } else
  {
    background(0);
  }
}

void keyPressed() {
    if (key == 'q') {  //Change the 'key' to whatever key on the keyboard you're using
      cont = 1;;
    } else if (key == 'w') {  //Change the 'key' to whatever key on the keyboard you're using
      cont = 2;
    } else if (key == 'e') {  //Change the 'key' to whatever key on the keyboard you're using
      cont = 3;
    } else if (key == 'r') {  //Change the 'key' to whatever key on the keyboard you're using
      cont = 4;
    } else {
      cont = 0;
    }
}

//VIDEO FUNCTION
void movieEvent(Movie m)
{
  if (m == video1)
  {
    video1.read();
  } else if (m == video2)
  {
    video2.read();
  } else if (m == video3)
  {
    video3.read();
  } else if (m == video4)
  {
    video4.read();
  }
}
