//Sketch basado en Designing Data Visualizations: Getting Started with Processing, en Skillshare
//Fuente: https://www.skillshare.com/classes/Designing-Data-Visualizations-Getting-Started-with-Processing/1063775924/projects

PImage baseMap;
String csv[];
String myData[][];

void setup() {
  size(454, 539);
  //noLoop();
  baseMap = loadImage("meridaMap.png");
  csv = loadStrings("MeteorStrikes.csv");
  myData = new String[csv.length][6];
  for (int i = 0; i < csv.length; i++) {
    myData[i] = csv[i].split(",");
  }


  fill(255, 0, 0, 50);
  noStroke();

  textAlign(CENTER, CENTER);
}

void draw() {
  image(baseMap, 0, 0, width, height);
  float mouseYear = map(mouseX, 0, width, -600, 2011);
  for (int i = 0; i < myData.length; i++) {
    fill(255, 0, 0, 50);
    float longitude = map(float(myData[i][3]), -89.7058, -89.5585, 0, width);
    float latitude = map(float(myData[i][4]), 21.0544, 20.8908, 0, height);
    float sizeMeteor = map(float(myData[i][2]), 0, 60000000, 5, 100);
    String city = myData[i][0];
    int year = int(myData[i][1]);    
    if (mouseYear > year) {
      ellipse(longitude, latitude, sizeMeteor, sizeMeteor);
      if (sizeMeteor > 50) {
        fill(0);
        textSize(15);
        text(city, longitude, latitude);
      }
    }
  }
  fill(0, 12);
  textSize(400);
  text(int(mouseYear), width/2, height/2);
}
