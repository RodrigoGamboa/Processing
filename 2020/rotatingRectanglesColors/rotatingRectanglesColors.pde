int numX = 10;
int numY = 10;
float sizeW;
float sizeH;
float ran1, ran2;
int col = 0;

void setup() {
  size(500, 500);
  //size(1080, 1920);
  smooth(8);
  sizeW = width/numX;
  sizeH = height/numY;
  noStroke();
  ran1 = random(1000);
  ran2 = random(0.01);
  background(0);
}

void draw() {
  //background(col);
  float time = float(millis())/1000;
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      pushMatrix();
      translate(sizeW*x, sizeH*y);
      //fill(map(x*y, 0, 100, 255, 0));
      col = getColor(noise(ran1+x-y*ran2)*colors.length*2);
      stroke(255-col);
      fill(col);
      //rotate(radians(map(x*y, 0, 100, 0, mouseX*3)));
      rotate(radians(map(sin(x*y*0.01+time), -1, 1, 0, 1000)));
      //rect(0, 0, sizeW, sizeH);
      //ellipse(0, 0, map(sin(x*y*0.01+time), -1, 1, 0, 1000), map(sin(x*y*0.01+time), -1, 1, 0, 1000));
      //fill(255-col);
      rect(0, 0, sizeW/(x+y), sizeH);
      popMatrix();
    }
  }
  fill(col, 10);
  rect(0, 0, width, height);
}

//int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #0c1cad};
//int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #062FAA};
//int colors[] = {#ED4715, #FFA3EC, #B0A8FF, #0D110F, #FFB951};
//int colors[] = {#00FF6F, #FF002C, #FFE74A, #ff6eec};
int colors[] = {#0C4425, #235438, #E8918F, #F1B0A9, #F3CBC9};
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
  //  El último paramétrop de la función 
  //  pow(v%1, ___) cambia de código a código
  return lerpColor(c1, c2, pow(v%1, 0.4));
}
