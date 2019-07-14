PImage[] fragment;
int n = 3;
int numcol = 3;
int numfil = 3;
int cont = 0;
void setup()
{
  size(200, 200);
  fragment = new PImage[21];
  int ancho = width / numcol;
  int alto = height / numfil;
  for (int i = 1; i < fragment.length; i++)
  {
    fragment[i] = loadImage("GenerativeArt_Example" + str(i) + ".jpg");
    fragment[i].resize(ancho, alto);
  }

  for (int i = 1; i < fragment.length; i++)
  {
          //tint(random(255), random(255), random(255));
    if(i <= 5)
    {
      image(fragment[i], ancho * (i - 1), 0);
    } else if (i > 5 && i <= 10)
    {
      image(fragment[i], ancho * (i - 6), alto);
    } else if (i > 10 && i <= 15)
    {
      image(fragment[i], ancho * (i - 11), alto * 2);
    } else
    {
      image(fragment[i], ancho * (i - 16), alto * 3);
    }
  }
  saveFrame("GenerativeArt.jpg");
}

void draw()
{
  /*

  */
}
