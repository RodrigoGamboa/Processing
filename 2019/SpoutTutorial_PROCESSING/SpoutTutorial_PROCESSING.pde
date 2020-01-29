import spout.*;

Spout spout;

void setup()
{
  size(600, 600, P2D);
  spout = new Spout(this);
  spout.createSender("Nuestro Plugin!");
  background(0, 5);
}

void draw()
{
  //background(0, 5);
  fill(200, 30, 30);
  ellipse(mouseX, mouseY, 100, 100);
  spout.sendTexture();
}
