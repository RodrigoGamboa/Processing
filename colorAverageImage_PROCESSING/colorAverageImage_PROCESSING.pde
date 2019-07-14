PImage image1, image2, image3;
color c1, c2, c3;
color colorPixel, colorPixelAverage;

void setup()
{
  size(450, 300);
  image1 = loadImage("neondemon1.jpg");
  image2 = loadImage("neondemon2.jpg");
  image3 = loadImage("neondemon3.jpg");
  background(0);
  noStroke();
  /*
  image(image1, 0, 0);
  c1 = get(image1.width/2, image1.height/2);
  fill(c1);
  rect(0, image1.height, image1.width, image1.height);
  */
  
  /*
  image(image1, 0, 0);
  loadPixels();
  for(int i = 0; i < image1.width * image1.height; i++)
  {
    colorPixel = colorPixel + pixels[i];
  }
  colorPixelAverage = colorPixel / (image1.width * image1.height);
  fill(colorPixel);
  println(colorPixel);
  rect(0, image1.height, image1.width, image1.height);
  */
  
  
  image(image2, image1.width, 0);
  c2 = get(image2.width + image2.width/2, image2.height/2);
  fill(c2);
  rect(image1.width, image2.height, image2.width, image2.height);
  
  /*
  image(image3, image1.width + image2.width, 0);
  c3 = get(image2.width * 2 + image3.width/2, image3.height/2);
  fill(c3);
  rect(image1.width + image1.width, image3.height, image3.width, image3.height);
  */
}

void draw()
{

}