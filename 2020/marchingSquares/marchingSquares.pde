float[][] field;

int rez = 15;
int cols, rows;
float increment = 0.1;
float zoff = 0;

OpenSimplexNoise noise;

void setup() {
  size(600, 400);
  noise  = new OpenSimplexNoise();
  cols = (width / rez) + 1;
  rows = (height / rez) + 1;
  field = new float[cols][rows];
  /*
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      field[i][j] = int(random(2));
    }
  }
  */
}

void draw() {
  background(0);
  
  float xoff = 0;
  for (int i = 0; i < cols; i++) {
    xoff += increment;
    float yoff = 0;
    for (int j = 0; j < rows; j++) {
      field[i][j] = (float)(noise.eval(xoff, yoff, zoff));
      yoff += increment;
    }
  }
  zoff += 0.03;
  
  float time = float(millis())/1000;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      //stroke(field[i][j]*255);
      //fill(field[i][j]*255, 0, 0);
      fill(field[i][j]*255, map(sin(time), -1, 1, 0, 255), map(sin(time), -1, 1, 255, 0));
      //strokeWeight(rez*0.4);
      noStroke();
      //point(i*rez, j*rez);
      rect(i*rez, j*rez, rez, rez);
      //ellipse(i*rez, j*rez, map(sin(time), -1, 1, 1, 20), map(sin(time), -1, 1, 1, 20));
    }
  }
  
  
  for (int i = 0; i < cols-1; i++) {
    for (int j = 0; j < rows-1; j++) {
      float x = i * rez;
      float y = j * rez;
      PVector a = new PVector(x+rez*0.5, y);
      PVector b = new PVector(x+rez, y+rez*0.5);
      PVector c = new PVector(x+rez*0.5, y+rez);
      PVector d = new PVector(x, y+rez*0.5);
      int state = getState(ceil(field[i][j]), ceil(field[i+1][j]), ceil(field[i+1][j+1]), ceil(field[i][j+1]));
      //stroke(255);
      //stroke(field[i][j]*255, map(sin(time), -1, 1, 0, 255), map(sin(time), -1, 1, 255, 0));
      strokeWeight(1);
      switch(state) {
        case 0:          
          break;
        case 1:
          line(c, d);
          break;
        case 2:
          line(b, c);
          break;
        case 3:
          line(b, d);
          break; 
        case 4:
          line(a, b);
          break;
        case 5:
          line(a, d);
          line(b, c);
          break;
        case 6:
          line(a, c);
          break;
        case 7:
          line(a, d);
          break;
        case 8:
          line(a, d);
          break;
        case 9:
          line(a, c);
          break;
        case 10:
          line(a, b);
          line(c, d);
          break;
        case 11:
          line(a, b);
          break; 
        case 12:
          line(b, d);
          break;
        case 13:
          line(b, c);
          break;
        case 14:
          line(c, d);
          break;
        case 15:         
          break;
        default:
          break;
      }
    }
  }
  
}

void line(PVector v1, PVector v2) {
  line(v1.x, v1.y, v2.x, v2.y);
}

int getState(int a, int b, int c, int d) {
  return a * 8 + b * 4 + c * 2 + d * 1;
}
