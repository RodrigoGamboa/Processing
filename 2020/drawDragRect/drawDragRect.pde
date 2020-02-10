int xi, yi, xf, yf = 0;
int flag = 0;

void setup () {
  size(500, 500);
}

void draw() {
  background(0);
  println(xi + " " + yi + " " + flag);
  if (flag == 1) {
    rect(xi, yi, mouseX-xi, mouseY-yi);
  } else if (flag == 2) {
    rect(xi, yi, xf-xi, yf-yi);
  }
  
  if(keyPressed) {
    if(key == ' ') {
      flag = 0;
    }
  }
}

void mouseClicked() {
  if (flag == 0 || flag > 1) {
    xi = mouseX;
    yi = mouseY;
    flag = 1;
  } else if (flag == 1) {
    xf = mouseX;
    yf = mouseY;
    flag = 2;
  }
}
