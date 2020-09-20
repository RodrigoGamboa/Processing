//  Análisis de arena, nomames, tokioo

//import org.processing.wiki.triangulate.*;
//import toxi.math.noise.SimplexNoise;

int seed = int(random(999999));

float nwidth =  960; 
float nheight = 960;
float swidth = 960; 
float sheight = 960;
float scale  = 1;

boolean export = false;

void settings() {
  scale = nwidth/swidth;
  size(int(swidth*scale), int(sheight*scale), P2D);
  smooth(8);
  pixelDensity(2); //erro de consola: pixelDensity(2) is not available for this display
}

void setup() {
  generate();
}

void draw() {
  //  Vacío siempre
}

void keyPressed() {
  if (key == 's') saveImage();
  else {
    seed = int(random(999999));
    generate();
  }
}

void generate() {
  //  ¿Cómo usa el colors[] aquí?
}

//  Funciones que son llamadas en el
//  generate(), por ejemplo: void circle,
//  void build, void cube, void grid, 

void saveImage() {
  String timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2); 
  saveFrame(timestamp+"-"+seed+".png");
}

//  Las opciones de color cambian de 
//  código a código
//int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #0c1cad};
//int colors[] = {#04EDC2, #FFED93, #F9F9F9, #000000, #062FAA};
//int colors[] = {#ED4715, #FFA3EC, #B0A8FF, #0D110F, #FFB951};
int colors[] = {#00FF6F, #FF002C, #FFE74A, #ff6eec};
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
