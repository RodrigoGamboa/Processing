//Ref: https://forum.processing.org/two/discussion/23861/live-video-delay-effect-where-from-here
import processing.video.*;
 
Capture camera;
int scale = 1;
void setup()
{
  size(640, 480, P3D);
  colorMode(HSB, 255);
 
  String[] cameras = Capture.list();
   
  camera = new Capture(this, width/scale, height/scale, cameras[0]);
  camera.start();
 
  // init feedback loop
  frames = new PImage[frame_count];
  for(int i = 0; i < frame_count; i++)
  {
      frames[i] = createImage(0, 0, 0);
  }
}
 
int frame_count = 10;
PImage[] frames;
boolean feedback = false;
void draw()
{
  background(255);
 
  if(keyPressed)
  {
    image(frames[index], 0, 0);
    for(int i = 0; i < frame_count; i++)
    {
      pushMatrix();
      pushStyle();
 
      tint(255, 255 / frame_count);
      //translate(0, 0, i * 80 / frame_count);
      image(frames[(index + i) % frame_count], 0, 0);
 
      popStyle();
      popMatrix();
    }
  }
  else
  {
    image(camera, 0, 0);
  }
 
  text(frameRate, 20, 20);
}
 
 
int index = 0;
void captureEvent(Capture camera)
{
  camera.read();
  PImage p = camera;
 
  if(keyPressed)
  {
    frames[index] = p.copy();
  }
 
  index += 1;
  if(index == frame_count)
  {
    index = 0;
  }
}
