int timeTracker = 0;
float timeInterval = 1;

void setup() {
  timeTracker = millis();
  size(500, 500);
  background(0);
  noStroke();
}

void draw() {
  if (millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    fill(255);
    quad(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
  }
  fill(0, 10);
  rect(0, 0, width, height);
} 

void mousePressed() {
  fill(255);
  quad(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
}
