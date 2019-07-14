String s = "YOUR QUEEN IS A LIZARD";
int firstTextSize = 1;
int textWidth = 0;
int textSize = 0;
void setup()
{
  size(420, 594);
  background(255);
  line(0, 1, width, 1);
  fill(0);
  textAlign(CENTER);

  //For the first Text
  do
  {
    textSize(firstTextSize);
    firstTextSize++;
  }
  while (textWidth(s) <= width);
  textWidth = int(textWidth(s));
  
  text(s, width/2, textAscent());
  println("firstTextSize: " + firstTextSize);
  
  textSize = firstTextSize;
  for (int i = 1; i < 10; i++)
  { 
    do
    {
      textSize(textSize);
      textSize = textSize - 3;
      println("textWidth: " + textWidth(s));
    }
    while (textWidth(s) >= textWidth);
    
    textWidth = int(textWidth(s));
    println("textSize: " + textSize);
    text(s, width/2, textAscent()+i*40);
  }
}
