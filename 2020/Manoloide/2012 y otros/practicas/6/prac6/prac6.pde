size(400, 400);
noStroke();
int tam = 40;
rectMode(CENTER);
for (int j = 0; j < height/tam; j++) {
  for (int i = 0; i < width/tam; i++) {
    float dis = dist(0,0,i*tam,j*tam);
    float tamano = map(dis,0,dist(0,0,width,height),tam,10);
    if ((i+j)%2 == 0) {
      rect(i*tam+tam/2, j*tam+tam/2, tamano, tamano);
    }
    else {
      ellipse(i*tam+tam/2, j*tam+tam/2, tamano, tamano);
    }
    
  }
}

