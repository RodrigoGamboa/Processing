void setup() {
  size(500, 500);
}

void draw() {
  for (int i = 0; i < 100; i++) {
    int col = getColor(noise(random(1000)+10*random(0.01))*colors.length*2);
    fill(col, random(255));
    rect(random(width), random(height), 100,  100);
  }
  noLoop();
}

int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #0c1cad};
//int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #062FAA};
//int colors[] = {#ED4715, #FFA3EC, #B0A8FF, #0D110F, #FFB951};
//int colors[] = {#00FF6F, #FF002C, #FFE74A, #ff6eec};
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
