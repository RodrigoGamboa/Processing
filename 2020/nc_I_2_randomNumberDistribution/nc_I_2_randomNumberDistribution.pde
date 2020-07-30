int[] randomCounts;
int numBars = 10;
float sizeX;

void setup() {
  size(500, 500);
  randomCounts = new int[10];
  for (int i = 0; i < numBars; i++) {
    randomCounts[i] = 0;
  }
  sizeX = width/numBars;
}

void draw() {
  int index = int(random(numBars));
  randomCounts[index]++;
  if(randomCounts[index] > height) {
    randomCounts[index] = 0;
  }
  
  for (int i = 0; i < numBars; i++) {
    rect(i*sizeX, height - randomCounts[i], sizeX, height);
  }
}
