import controlP5.*;

ControlP5 cp5;

int countParticles = 100;
float minSize = 0; 
float maxSize = 20;
float pwrSize = 1.2;
float velSize = 0.06;

float velocity = 5;
float pwrVel = 2;
float bouder = 10;


int seed = int(random(999999));

ArrayList<Node> nodes;
float det, des;

void setup() {

  size(960, 540, P2D);
  pixelDensity(2);
  smooth(2);

  ui();

  generate();
}

void ui() {
  cp5 = new ControlP5(this);
  
  Group g1 = cp5.addGroup("g1")
                .setPosition(10, 20)
                .setSize(200, 200)
                .setBackgroundColor(color(0, 80))
                ;
  
  cp5.addSlider("countParticles", 0, 200)
     .setPosition(10, 10)
     .setGroup(g1);
  cp5.addSlider("minSize", 0, 400)
     .setPosition(10, 30)
     .setGroup(g1);
  cp5.addSlider("maxSize", 0, 400)
     .setPosition(10, 50)
     .setGroup(g1);
  cp5.addSlider("pwrSize", 0, 4)
     .setPosition(10, 70)
     .setGroup(g1);
  cp5.addSlider("velSize", 0, 1)
     .setPosition(10, 90)
     .setGroup(g1);

  cp5.addSlider("velocity", 0, 10)
     .setPosition(10, 110)
     .setGroup(g1);
  cp5.addSlider("pwrVel", 0, 4)
     .setPosition(10, 130)
     .setGroup(g1);
  cp5.addSlider("bouder", 0, 20)
     .setPosition(10, 150)
     .setGroup(g1);
}

void draw() {

  background(255);


  for (int i = 0; i < nodes.size(); i++) {
    Node n1 = nodes.get(i);
    for (int j = 0; j < nodes.size(); j++) {
      Node n2 = nodes.get(j);
      float dis = n1.pos.dist(n2.pos);
      float maxDis = (n1.size+n2.size)*bouder*0.5;
      if (dis < maxDis) {
        float ang = atan2(n2.pos.y-n1.pos.y, n2.pos.x-n1.pos.x);
        float vel = velocity*pow(map(dis, 0, maxDis, 1, 0), pwrVel);
        n1.force.add(cos(ang-PI)*vel, sin(ang-PI)*vel);
        n2.force.add(cos(ang)*vel, sin(ang)*vel);
      }
    }
  }

  for (int i = 0; i < nodes.size(); i++) {
    Node n = nodes.get(i); 
    n.update();
    n.show();
    if (n.remove) nodes.remove(i--);
  }
}

void randomParams() {
  countParticles = int(random(80, 200));
  minSize = random(40)*random(1); 
  maxSize = random(400);
  pwrSize = random(0.5, 2);
  velSize = random(1)*random(1);

  velocity = random(10)*random(0.4, 1);
  pwrVel = random(0.2, 3);
  bouder = random(20)*random(1);
  
  
  cp5.getController("countParticles").setValue(countParticles);
  cp5.getController("minSize").setValue(minSize);
  cp5.getController("maxSize").setValue(maxSize);
  cp5.getController("pwrSize").setValue(pwrSize);
  cp5.getController("velSize").setValue(velSize);
  
  cp5.getController("velocity").setValue(velocity);
  cp5.getController("pwrVel").setValue(pwrVel);
  cp5.getController("bouder").setValue(bouder);
}

void keyPressed() {
  if (key == ' ') {
    seed = int(random(999999));
    generate();
  }
  if (key == 'r') {
    randomParams();
  }
}

void mouseDragged() {
  nodes.add(new Node(mouseX, mouseY));
}


void generate() {

  randomSeed(seed);

  det = random(0.1);
  des = random(1000);

  nodes = new ArrayList<Node>();
  for (int i = 0; i < countParticles; i++) {
    nodes.add(new Node(random(width), random(height)));
  }
}

//int colors[] = {#EC629E, #E85237, #ED7F26, #C28A17, #114635, #000000};
//int colors[] = {#34302E, #72574C, #9A4F7D, #488753, #D9BE3A, #D9CF7C, #E2DFDA, #CF4F5C, #368886};
int colors[] = {#000000, #33346B, #567BF6, #B4CAFB, #FFFFFF, #FFB72A, #FF4C3D};
int rcol() {
  return colors[int(random(colors.length))];
}
int getColor() {
  return getColor(random(colors.length));
}
int getColor(float v) {
  v = abs(v);
  v = v%(colors.length); 
  int c1 = colors[int(v%colors.length)]; 
  int c2 = colors[int((v+1)%colors.length)]; 
  return lerpColor(c1, c2, v%1);
}