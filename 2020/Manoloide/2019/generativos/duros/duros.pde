import org.processing.wiki.triangulate.*;
import toxi.math.noise.SimplexNoise;

int seed = int(random(999999));

float nwidth =  960; 
float nheight = 960;
float swidth = 960; 
float sheight = 960;
float scale  = 1;

boolean export = false;

void settings() {
  scale = nwidth/swidth;
  size(int(swidth*scale), int(sheight*scale), P3D);
  smooth(8);
  pixelDensity(2);
}

void setup() {

  generate();

  if (export) {
    saveImage();
    exit();
  }
}

void draw() {
}

void keyPressed() {
  if (key == 's') saveImage();
  else {
    seed = int(random(999999));
    generate();
  }
}

void generate() { 

  randomSeed(seed);
  noiseSeed(seed);


  randPallets();
  detDef = random(0.0008, 0.001)*0.6;
  detAmp = random(0.0008, 0.001)*0.6;

  blendMode(NORMAL);
  //background(getColor());
  background(0);

  pushMatrix();
  translate(width*0.5, height*0.5);
  scale(1.3);
  translate(-width*0.5, -height*0.5);
  popMatrix();

  float detAng = random(0.001);
  float desAng = random(10000);
  float detAng2 = random(0.001);
  float desAng2 = random(10000);
  float detCol = random(0.0004, 0.0006)*0.4;
  float desCol = random(10000);

  float detLar = random(0.001);
  float desLar = random(0.001);



  float radNoise = random(0.001);
  blendMode(ADD);
  noFill();

  float detPwrCol = random(0.02);

  float bb = 30;
  strokeWeight(2);
  for (float j = bb; j < height-bb; j+=2) {
    for (float i = bb; i < width-bb; i+=2) {
      float x = i;
      float y = j+cos(x*0.2);
      float nc = noise(desCol+x*detCol, desCol+y*detCol)*colors.length;
      beginShape(LINES);
      float lar = noise(desLar+x*detLar, desLar+y+detLar)*60;
      for (int k = 0; k < lar; k++) {
        float ang = (float) SimplexNoise.noise(detAng+x*desAng, detAng+y*desAng);
        ang += noise(desAng2+x+cos(ang)*radNoise, desAng2+y+radNoise);
        float n2 = (float) SimplexNoise.noise(nc*0.2, k*0.001);
        float pwrCol = lerp(noise(x*detPwrCol, y*detPwrCol)*2, 0.5, 0.2);
        stroke(getColor(n2*30+ang*0.05, pwrCol), random(40, 50)*0.4);
        PVector p = def(x, y);

        vertex(p.x, p.y);
        x += cos(ang);
        y += sin(ang);
      }
      endShape();
    }
  }
} 


float detDef, detAmp;
PVector def(float x, float y) {
  float ang = (float) noise(x*detDef, y*detDef, seed)*2;
  float mod = ang%(1./8);
  float smt = constrain((mod*8)*4-2, 0, 1);
  ang = ang-mod*smt;
  ang *= TAU;
  float amp = (float) (SimplexNoise.noise(x*detAmp, y*detAmp, seed)*0.5+0.5)*100;
  return new PVector(x+cos(ang)*amp, y+sin(ang)*amp);
}

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  saveFrame(timestamp+"-"+seed+".png");
}

void randPallets() {
  int aux[] = {#F23602, #300F96, #C9FFF6, #F72C81, #09EFA6, #fac62a};
  colors = aux;

  int aux2[] = new int[int(random(3, 6))];
  for (int i = 0; i < aux2.length; i++) {
    aux2[i] = rcol();
  }
  colors = aux2;
}


//int colors[] = {#E1E8E0, #F5CE4B, #FC5801, #025DC4, #02201A, #489B4D};
//int colors[] = {#F0C7C0, #F65A5C, #3080E9, #50E2C6, #F7D3C3, #F41B9C};
//int colors[] = {#EF3621, #295166, #C9E81E, #0F190C, #F5FFFF};
//int colors[] = {#F5B4C4, #FCCE44, #EE723F, #77C9EC, #C5C4C4, #FFFFFF};
//int colors[] = {#0E1619, #024AEE, #FE86F0, #FD4335, #F4F4F4};
//int colors[] = {#F7DF04, #EAE5E5, #7332AD, #000000, #92A7D3};
//int colors[] = {#333A95, #FFDC15, #FC9CE6, #31F5C2, #1E9BF3};
//int colors[] = {#333A95, #F6C806, #F789CA, #1E9BF3};
int colors[] = {#F23602, #300F96, #C9FFF6, #F72C81, #09EFA6, #fac62a};
int rcol() {
  return colors[int(random(colors.length))];
}
int getColor() {
  return getColor(random(colors.length), 1);
}
int getColor(float v, float p) {
  v = abs(v);
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, pow(v%1, p));
}
