import processing.video.*;
Capture cam;

void setup()
{
  fullScreen(P3D);
  cam = new Capture(this, width, height);
  cam.start();
  noStroke();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  
  translate(width/2, height/2);
  directionalLight(255, 255, 255, 0, 0, -1);
  rotateY(frameCount*0.1);
  
  float tileSize = width/100;
  
  for(int x=0; x < cam.width; x+=tileSize)
  {
    for(int y=0; y < cam.width; y+=tileSize)
    {
      color pixelColor = cam.get(x, y);
      float b = map(brightness(pixelColor), 0, 255, 0, 15);
      
      pushMatrix();
      translate(x-width/2, y-height/2);
      fill(pixelColor);
      box(7, 7, b*tileSize);
      popMatrix();
    }  
  }
}

void captureEvent(Capture c)
{
  c.read();
}
