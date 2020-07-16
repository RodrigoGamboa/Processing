float x, y;
float xSpeed = 2.0; 
float ySpeed = 5;

void setup() {
  size(500, 500);
  x = random(width);
  y = random(height);
}

void draw() {
  //xSpeed = map(mouseX, 0, width, 2.0, 5);
  //ySpeed = map(mouseY, 0, height, 2.5, 5);
  
  x += xSpeed;
  y += ySpeed;
  
  if (x < 0 || x > width) {
    xSpeed *= -1;
  }
  if (y < 0 || y > height) {
    ySpeed *= -1;
  }
  
  
  fill(0);
  ellipse(x, y, 80, 80);
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
}
