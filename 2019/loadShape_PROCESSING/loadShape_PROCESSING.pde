//Processing example. loadShape().
//Not working yet. Probably the file's size is too big. 

PShape s;

void setup() {
  size(500, 500, P3D);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("rodrigo_03.obj");
}

void draw() {
  background(204);
  translate(width/2, height/2);
  shape(s, 0, 0);
}
