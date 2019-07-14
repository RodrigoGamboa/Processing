float xoff = 0.0;
int offset = 2;
void setup()
{
  size(500, 500);
  background(0);
  //noStroke();
}

void draw()
{  
  background(0);
  for(int x = 0; x < width/2; x = x + offset)
  {
    for(int y = 0; y < height; y  = y + offset)
    {
      fill(random(255));
      rect(x, y, offset, offset);      
    }    
  }
  
  for(int x = width/2; x < width; x = x + offset)
  {
    for(int y = 0; y < height; y  = y + offset)
    {
      float n = noise(xoff) * 255;
      fill(n);
      rect(x, y, offset, offset); 
      xoff += 0.5;
    }    
  }
}
