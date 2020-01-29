import processing.video.*;

Capture video;

void captureEvent(Capture video) {
  video.read();
}

void setup() {
  size(320, 240);
  video = new Capture(this, 320, 240);
  video.start();
}

void draw() {
  //image(video, 0, 0);
  loadPixels();
  video.loadPixels();
  for (int x = 0; x < width-1; x++) {
    for (int y = 0; y < height; y++) {
      int loc1 = x+y*width;
      int loc2 = (x+1)+y*width;
      float b1 = brightness(video.pixels[loc1]);
      float b2 = brightness(video.pixels[loc2]);
      float diff = abs(b1-b2);
      if (diff > mouseX) {
        pixels[loc1] = color(255);
      } else {
        pixels[loc1] = color(0);
      }



      //FLASHLIGHT EFFECT
      /*
      float r = red(video.pixels[loc]);
       float g = green(video.pixels[loc]);
       float b = blue(video.pixels[loc]);
       float d = dist(mouseX, mouseY, x, y);
       float factor = map(d, 0, 80, 1, 0);
       pixels[loc] = color(r*factor, g*factor, b*factor);
       */
    }
  }
  updatePixels();
}
