int lados = 5;
float radius = 50;

float stepLado;
int cenX, cenY;
float posX, posY;

float[] pointsX;
float[] pointsY;

void setup() {
  size(500, 500);
  stepLado = 360/lados;
  cenX = width/2;
  cenY = height/2;
  noFill();
  
  pointsX = new float[lados];
  pointsY = new float[lados];
}

void draw() {
  background(255);
  
  translate(cenX, cenY);
  for (int d = 0; d < 360; d+=stepLado) { 
    posX = radius * cos(radians(d));
    posY = radius * sin(radians(d));
    pointsX[int(d/stepLado)] = posX;
    pointsY[int(d/stepLado)] = posY;
  }
  for (int i = 0; i < lados; i++) {
    if(i < lados-1)
    {
      triangle(pointsX[i], pointsY[i], pointsX[i+1], pointsY[i+1], 0, 0);
      line(((pointsX[i+1]-pointsX[i])/2)*sin((radians((180-stepLado)/2))), ((pointsY[i+1]-pointsY[i])/2)*cos((radians((180-stepLado)/2))), mouseX, mouseY);
    }
    else
      triangle(pointsX[i], pointsY[i], pointsX[0], pointsY[0], 0, 0);
      line(((pointsX[0]-pointsX[i])/2)*sin((radians((180-stepLado)/2))), ((pointsY[0]-pointsY[i])/2)*cos((radians((180-stepLado)/2))), mouseX, mouseY);
  }
  //noLoop();
}
