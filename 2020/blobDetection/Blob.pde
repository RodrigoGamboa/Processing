class Blob {
  float minX;
  float minY;
  float maxX;
  float maxY;
  
  Blob(float x, float y) {
    minX = x;
    minY = y;
    maxX = x;
    maxY = y;
  }
  
  void show() {
    stroke(0);
    fill(255);
    rectMode(CORNERS);
    rect(minX, minY, maxX, maxY);
  }
  
  void add(float x, float y) {
    minX = min(minX, x);
    minY = min(minY, y);
    maxX = max(maxX, x);
    maxY = max(maxY, y);
  }
  
  boolean isNear(float px, float py) {
    float cx = (minX + maxX) / 2;
    float cy = (minY + maxY) / 2;
    
    float d = distSq(cx, cy, px, py);
    if(d < distThreshold*distThreshold) {
      return true;
    } else {
      return false;
    }
  }
}
