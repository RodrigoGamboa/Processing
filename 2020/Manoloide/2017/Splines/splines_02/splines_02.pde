int seed = int(random(9999999));

Spline spline;

void setup() {
  //size(960, 540, P3D);
  size(720, 480, P3D);
  /*
  cam = new PeasyCam(this, 100);
   cam.setMinimumDistance(5);
   cam.setMaximumDistance(5000);
   */

  pixelDensity(2);
  smooth(8);

  generate();
}


void draw() {
  float time = frameCount*0.001;
  PVector pos = spline.getPoint(time);
  PVector dir = spline.getDir(time);

  randomSeed(seed);
  //lights();
  directionalLight(160, 160, 160, dir.x, dir.y, dir.z);
  ambientLight(80, 80, 80);
  background(0);
  float fov = PI/2;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/100.0, cameraZ*1000.0);
  PVector camPos = spline.getPoint(time-0.01);
  camera(camPos.x, camPos.y, camPos.z, pos.x, pos.y, pos.x, asin(-dir.y), atan2(dir.x, dir.z), 0);

  stroke(255, 80, 0);
  //line(pos.x, pos.y, pos.z, pos.x+dir.x*100, pos.y+dir.y*100, pos.z+dir.z*100);
  noFill();
  stroke(0);
  //spline.show();

  noStroke();
  //fill(0);
  stroke(255);
  strokeWeight(2);
  int cc = 60;
  rectMode(CENTER);
  for (int i = 0; i < cc; i++) {
    float pp = i*1./cc;
    PVector p = spline.getPoint(pp);
    PVector d = spline.getDir(pp);
    pushMatrix();
    translate(p.x, p.y, p.z);
    rotateVector(d);
    //box(40);
    int col = getColor(i*0.32+time);
    int rnd = int(random(3)); 
    int sub = int(random(1, 10))*2+1;
    float s = 10000;
    float ss = s/sub;
    if (rnd == 0 || rnd == 1) {
      if (rnd == 0) {
        noStroke();
        fill(col);
      } else {
        noFill();
        stroke(col);
      }
      for (int yy = 0; yy < sub; yy++) {
        float y = (yy-sub*0.5+0.5)*ss;
        for (int xx = 0; xx < sub; xx++) {
          if ((xx+yy)%2 == 0) continue;
          float x = (xx-sub*0.5+0.5)*ss;
          if (rnd == 1) rect(x, y, ss, ss);
          else {
            pushMatrix();
            translate(x, y);
            box(ss);
            popMatrix();
          }
        }
      }
    } else if (rnd == 2) {
      noFill();
      stroke(col);
      for (int k = 0; k <= sub; k++) {
        float v = map(k, 0, sub, -ss, ss);
        line(-ss, v, ss, v); 
        line(v, -ss, v, ss);
      }
    }
    //ellipse(0, 0, 120, 120);
    popMatrix();
  }

  /*
  noStroke();
   fill(255, 80, 0);
   pushMatrix();
   translate(pos.x, pos.y, pos.z);
   box(20);
   popMatrix();
   */
}

void keyPressed() {
  generate();
}

void generate() {
  seed = int(random(9999999));
  randomSeed(seed);
  ArrayList<PVector> points = new ArrayList<PVector>();
  float ss = 50000;
  for (int i = 0; i < 5; i++) {
    points.add(new PVector(random(-ss, ss), random(-ss, ss), random(-ss, ss)));
  }
  spline = new Spline(points);
}

void rotateVector(PVector d) {
  float rx = asin(-d.y);
  float ry = atan2(d.x, d.z);
  rotateY(ry);
  rotateX(rx);
}

class Spline {
  ArrayList<PVector> points;
  float dists[];
  float length;
  Spline(ArrayList<PVector> points) {
    this.points = points;
    calculate();
  }

  void calculate() {
    dists = new float[points.size()+1];
    length = 0; 

    int res = 10;
    for (int i = 0; i <= points.size(); i++) {
      float ndis = 0;
      PVector ant = getPointLin(i);
      for (int j = 1; j <= res; j++) {
        PVector act = getPointLin(i+j*1./res);
        ndis += ant.dist(act);
        ant = act;
      }
      dists[i] = length;
      if (points.size() != i) length += ndis;
    }
  }

  void show() {
    PVector p1, p2, p3, p4;
    p1 = points.get(points.size()-1);
    p2 = points.get(0);
    p3 = points.get(1);
    p4 = points.get(2);
    curveTightness(0);
    curve(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, p3.x, p3.y, p3.z, p4.x, p4.y, p4.z);
    for (int i = 0; i < points.size()-1; i++) {
      p1 = points.get(i);
      p2 = points.get(i+1);
      p3 = points.get((i+2)%points.size());
      p4 = points.get((i+3)%points.size());
      curve(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, p3.x, p3.y, p3.z, p4.x, p4.y, p4.z);
    }
    curve(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, p3.x, p3.y, p3.z, p4.x, p4.y, p4.z);
  }

  PVector getPointLin(float v) {
    v = v%points.size();
    int ind = int(v);
    float m = v%1.;
    return calculatePoint(ind, m);
  }

  PVector getPoint(float v) {
    v = (v%1)*length;
    int ind = 0;
    float antLen = dists[ind];
    float actLen = dists[ind+1];
    while (actLen < v && ind <= points.size()) { 
      ind++;
      antLen = actLen;
      actLen = dists[(ind+1)];
    }
    float m = map(v, antLen, actLen, 0, 1);
    return calculatePoint(ind, m);
  }

  PVector calculatePoint(int ind, float m) {
    int ps = points.size();
    PVector p1 = points.get((ind-1+ps)%ps);
    PVector p2 = points.get((ind+0+ps)%ps);
    PVector p3 = points.get((ind+1+ps)%ps);
    PVector p4 = points.get((ind+2+ps)%ps);
    float xx = curvePoint(p1.x, p2.x, p3.x, p4.x, m);
    float yy = curvePoint(p1.y, p2.y, p3.y, p4.y, m);
    float zz = curvePoint(p1.z, p2.z, p3.z, p4.z, m);
    return new PVector(xx, yy, zz);
  }

  PVector getDir(float v) {
    PVector act = getPoint(v);
    PVector p1 = act.copy().sub(getPoint(v-0.01));
    PVector p2 = getPoint(v+0.01).sub(act);
    PVector aux = p1.add(p2).mult(0.5);
    return aux.normalize();
  }
}  



int colors[] = {#FF4400};//{#FFD52C, #F57839, #7C2FAD, #E0E0E0};
int rcol() {
  return colors[int(random(colors.length))] ;
}
int getColor(float v) {
  v = v%(colors.length);
  int c1 = colors[int(v%colors.length)];
  int c2 = colors[int((v+1)%colors.length)];
  return lerpColor(c1, c2, v%1);
}