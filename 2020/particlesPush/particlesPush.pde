//Ejemplo de interacción de particulas de colores cuando se presiona la pantalla touch.
//Parte del experimento de videomapping casero, utilizando la app Processing for iOS.
//Este es un remix de un código de The Nature of Code, de Daniel Shiffman. http://natureofcode.com

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
  size(360, 640);  //Utilizar esta función de size() para Processing en la computadora.
  //size(screenWidth, screenHeight);  //Utilizar esta función de size() para Processing for iOS.
  
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

class Vehicle {

  // All the usual stuff
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    // Constructor initialize all values
  Vehicle(float x, float y) {
    position = new PVector(x, y);
    r = 28;  //Radio de cada partícula
    //maxspeed = 3;
    maxspeed = 6;
    maxforce = 0.2;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
     PVector separateForce = separate(vehicles);
     //PVector seekForce = seek(new PVector(mouseX,mouseY));
     PVector seekForce = seek(new PVector(width/2, height/2));
     separateForce.mult(2);
     seekForce.mult(1);
     applyForce(separateForce);
     applyForce(seekForce); 
  }
  
    // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
    
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    return steer;
  }

  // Separation
  // Method checks for nearby vehicles and steers away
  PVector separate (ArrayList<Vehicle> vehicles) {
    //float desiredseparation = r*2;
    float desiredseparation = r*touch;
    PVector sum = new PVector();
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Vehicle other : vehicles) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.sub(velocity);
      sum.limit(maxforce);
    }
    return sum;
  }


  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void display() {
    fill(colorParticles);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }

}
