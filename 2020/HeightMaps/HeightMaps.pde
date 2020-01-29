import peasy.*;
PeasyCam cam;

PImage img;
int size = 4;
int [][] cols = new int[600/size][900/size];
int [][] hs = new int[600/size][900/size];

void setup() {
  size(600, 600, P3D);
  background(0);
  
  cam = new PeasyCam(this, 500);
  translate(-300, -300);
  
  img = loadImage("Downloads/IMG_20190218_123854.jpg");
  img.resize(500, 0);
  imageMode(CENTER);
  image(img, width/2, height/2);
  
  for(int x = 0; x < 600; x += size)
  {
    for(int y = 0; y < 600; y += size)
    {
      color c = get(x, y);
      cols[x/size][y/size] = c;
    }
  }
}

float da = 0;
void draw() {
  background(0);
  translate(-300, -300);
  for(int x = 0; x < 600; x += size)
  {
    for(int y = 0; y < 600; y += size)
    {
      float dst = dist(x, y, 300, 300);
      dst = map(dst, 0, 400, 0, 6.28);
      dst -= da;
      color c = cols[x/size][y/size];
      float h = red(c) + green(c) + blue(c);
      h = log(-dst)*cos(-dst)*h/5;
      noStroke();
      fill(c);
      pushMatrix();
      translate(x, y);
      rotate(sin(da));
      box(size, size, h);
      popMatrix();
    }
    da += 0.00001;
  }
  da += 0.1;
}
