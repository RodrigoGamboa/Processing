// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A list of vehicles
ArrayList<Vehicle> vehicles;

int touch = 1;  //Distancia entre partículas cuando no hay touch.
int touchPressed = 10;  //Distancia entre partículas cuando se presiona.
int timeTracker = 0;
float timeInterval = 4;  //Tiempo de recuperación después de presionar. 
int colorAttack = color(255, 0, 0);
int colorRelease = color(0, 0, 255);
int colorParticles = colorAttack; 

void setup() {
  //size(640,360);
  size(360, 640);
  // We are now making random vehicles and storing them in an ArrayList
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 100; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
  timeTracker = millis();
}

void draw() {
  background(0);

  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function
    v.applyBehaviors(vehicles);
    // Call the generic run method (update, borders, display, etc.)
    v.update();
    v.display();
  }

  if (touch == touchPressed && millis() > timeTracker + timeInterval*1000) {
    timeTracker = millis();
    touch = 1;
    colorParticles = colorAttack;
  }

  // Instructions
  //fill(0);
  //text("Drag the mouse to generate new vehicles.",10,height-16);
  
  //fill(255, 50);
  //ellipse(width/2, height/2, width, width);
}


void mouseDragged() {
  //vehicles.add(new Vehicle(mouseX,mouseY));
  vehicles.add(new Vehicle(width/2, height/2));
}

void mousePressed() {
  touch = touchPressed;
  colorParticles = colorRelease;
}
