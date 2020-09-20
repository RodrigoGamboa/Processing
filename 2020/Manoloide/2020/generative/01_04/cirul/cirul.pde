import org.processing.wiki.triangulate.*;
import toxi.math.noise.SimplexNoise;

int seed = 58621;//int(random(999999));

float nwidth =  960;
float nheight = 960;
float swidth = 960; 
float sheight = 960;
float scale  = 1;

PGraphics mask;
PShader blur;
PImage brush;
PImage brushes[];

boolean export = false;
void settings() {
  scale = nwidth/swidth;
  size(int(swidth*scale), int(sheight*scale), P2D);
  smooth(8);
  pixelDensity(2);
}

void setup() {

  brushes = new PImage[4];
  for (int i = 0; i < 4; i++) {
    brushes[i] = loadImage("brush/brush0"+str(i+1)+".png");
  }

  blur = loadShader("blur.glsl");
  brush = loadImage("brush2.png");

  generate();

  if (export) {
    saveImage();
    exit();
  }
}

void draw() {
  //generate();
}

void keyPressed() {
  if (key == 's') saveImage();
  else {
    seed = int(random(999999));
    generate();
  }
}

void generate() {


  blur = loadShader("blur.glsl");



  int cc = int(random(6, 16));
  float ss = width*(1./cc);

  PGraphics blank = createGraphics(1, 1);
  blank.beginDraw();
  blank.background(255);
  blank.endDraw();

  mask = createGraphics(width, height);
  mask.beginDraw();
  mask.noStroke();
  mask.imageMode(CENTER);
  mask.background(0);
  for (int i = 0; i < 40; i++) {
    float xx = random(width);
    float yy = random(height);
    xx -= xx%ss;
    yy -= yy%ss;
    float s = width*random(1.8)*random(0.2, 1)*random(0.5, 1);
    s *= random(4)*random(0.2, 1);
    mask.tint(random(10, 255), random(10, 255), random(10, 255), random(255));
    //mask.tint(255);
    mask.pushMatrix();
    mask.translate(xx, yy);
    mask.rotate(random(TAU));
    PImage aux = (random(1) < 0.5)? brush : brushes[int(random(4))];
    mask.image(aux, 0, 0, s*random(0.8, 2), s*random(0.8, 2));
    mask.popMatrix();

    if (random(1) < 0.2) {
      float y = random(height);
      mask.fill(255, random(200));
      mask.rect(0, y, width, random(150)*random(1));
    }
    if (random(1) < 0.7) {
      float x = random(height);
      mask.fill(0, random(200));
      mask.rect(x, 0, random(150)*random(1), height);
    }
  }
  for (int i = 0; i < 10; i++) {
    float yy = random(height);
    mask.fill(255, random(200));
    mask.rect(0, yy, width, random(150)*random(1));
  }

  for (int i = 0; i < 100; i++) {
    float xx = random(height);
    mask.fill(0, random(240));
    mask.rect(xx, 0, random(150)*random(1), height);
  }
  mask.endDraw();

  randomSeed(seed);
  noiseSeed(seed);
  background(0);

  float ic = random(colors.length);
  float ac = random(0.2, 1.2);
  cc = 600;
  imageMode(CENTER);
  for (int i = 0; i < cc; i++) {
    float xx = random(width);
    float val = random(1)*random(0.6, 1);
    float yy = height*val;
    //xx = width*random(0.45, 0.55);//0.5;
    //yy = height*random(0.45, 0.55);//0.5;
    float ww = width*random(0.7, 1.4)*random(1)*random(0.2, 1);
    float hh = height*random(0.1, 0.5)*random(0.4+val*0.4)*2;
    //ww = hh = hh*random(2);
    float min = min(ww, hh)*2;
    ww = lerp(ww, min, random(1));
    hh = lerp(hh, min, random(1));

    if (random(1) < 0.2) blendMode(ADD);
    //else if (random(1) < 0.2) blendMode(DARKEST);
    else blendMode(NORMAL);

    tint(getColor(i*ac+ic), random(260));
    
    PImage aux = (random(1) < 0.5)? brush : brushes[int(random(4))];
    pushMatrix();
    translate(xx, yy);
    rotate(random(TAU));
    image(aux, 0, 0, ww, hh);
    popMatrix();
  }

  noTint();

  //nt+random(1000));
  blur.set("mask", mask.get());
  float it = random(100);
  float dt = random(0.01);
  for (int i = 0; i < 80; i++) {
    blur.set("time", it+i*dt);
    float ang = random(TAU);
    float blurAmp = 0.0001+i*0.004;
    blur.set("direction", blurAmp*cos(ang), blurAmp*sin(ang));
    filter(blur); 
    //blur.set("direction", 0, blurAmp*random(0.5, 1));
    //filter(blur);
  }

  //image(mask, 10, 10, 100, 100);
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame(timestamp+"-"+seed+".png");
}

int colors[] = {#2B349E, #F57E15, #ED491C, #9B407D, #B48DC0, #E3E8EA};
//int colors[] = {#0A0B0B, #2E361E, #ACB2A4, #B66F3A, #B91A1B};
//int colors[] = {#B85807, #FAC440, #F4C8BF, #A0B9A6, #A1B2EA};
//int colors[] = {#B2734B, #A69050, #897E6A, #5B6066, #292E31};
//int colors[] = {#ff0000, #00ff00, #0000ff, #ffffff, #000000};
//int colors[] = {#231800, #161C23, #2d101c, #191800, #060F21};
int rcol() {
  return colors[int(random(colors.length))];
}

int getColor() {
  return getColor(random(colors.length));
}

int getColor(float v) {
  v = abs(v); 
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, pow(v%1, 0.6));
} 
