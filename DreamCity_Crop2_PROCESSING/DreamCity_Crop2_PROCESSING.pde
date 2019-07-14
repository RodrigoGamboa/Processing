void setup()
{
  size(1024, 768);
  background(0);
  noStroke();
}

void draw()
{
  //SHAPES
  //1
  fill(99, 148, 118);
  triangle(0, 0, 76, 0, 0, 214);
  //2  
  fill(72, 84,  61);
  //stroke(20, 27, 20);
  quad(-15, 254, 15, 252, 96, 23, 75, -5);
  //3
  fill(103, 113, 88);
  quad(15, 252, 23, 252, 105, 51, 96, 23);
  //4
  fill(104, 142, 120);
  quad(23, 252, 42, 253, 113, 74, 105, 51);
  quad(42, 253, 106, 253, 100, 203, 65, 195);
  //5
  fill(155, 143, 118);
  quad(65, 195, 116, 205, 131, 151, 115, 70);
  //5.5
  fill(137, 128, 101);
  triangle(90, 201, 116, 204, 106, 253);
  //6
  fill(48, 48, 33);
  triangle(80, 0, 104, 48, 143, 0);
  //7
  fill(79, 98, 71);
  quad(104, 48, 123, 112, 168, 0, 143, 0);
  //8
  fill(110, 106, 89);
  triangle(123, 112, 132, 150, 168, 0);
  //16
  fill(39, 33, 18);
  quad(280, 0, 331, 102, 400, 64, 376, 0);
  //15
  fill(39, 36, 19);
  triangle(168, 0, 170, 48, 252, 0);
  //14
  fill(81, 88, 64);
  quad(170, 50, 170, 62, 284, 0, 254, 0);
  //13
  fill(82, 93, 61);
  quad(170, 62, 172, 84, 290, 15, 284, 0);
  //12
  fill(86, 106, 74);
  //noStroke();
  triangle(171, 73, 175, 115, 178, 78);
  quad(178, 78, 175, 115, 296, 31, 292, 15);
  //11
  fill(95, 142, 116);
  quad(168, 0, 146, 96, 150, 152, 180, 140);
  quad(148, 130, 153, 196, 332, 99, 298, 30);
  //10
  fill(167, 156, 131);
  quad(144, 157, 153, 202, 306, 121, 291, 66);
  //23
  fill(57, 67, 46);
  quad(370, 0, 639, 48, 646, 35, 462, 0);
  triangle(409, 0, 534, 26, 536, 0);
  //22
  fill(78, 99, 79);
  quad(372, 0, 381, 22, 627, 62, 638, 47);
  //21
  fill(71, 141, 107);
  quad(380, 19, 390, 56, 613, 88, 630, 57);
  //20
  fill(74, 137, 111);
  quad(389, 50, 395, 85, 593, 123, 619, 82);
  //19
  fill(144, 150, 122);
  quad(391, 77, 443, 186, 566, 174, 605, 118);
  //8.5
  fill(212, 211, 213);
  //noStroke();
  triangle(100, 253, 156, 253, 146, 94);
  quad(156, 253, 394, 249, 394, 66, 152, 194);
  triangle(394, 249, 482, 240, 394, 66);
  quad(452, 178, 541, 165, 508, 235, 462, 243);
  //9
  fill(176, 167, 128);
  quad(114, 204, 100, 253, 256, 252, 237, 225);
  //9.5 y 9.6
  fill(195, 195, 150);
  quad(347, 110, 352, 125, 365, 123, 367, 107);
  fill(190, 187, 142);
  quad(388, 120,  389, 140, 403, 142, 402, 123);
  
  //17
  fill(165, 146, 113);
  ellipse(360, 192, 118, 118);
  //18
  fill(110, 151, 117);
  quad(344, 246, 372, 248, 370, 135, 346, 135);
  
  //
  fill(10, 10, 3);
  quad(535, 0, 532, 22, 681, 37, 685, 0);
  quad(667, 0, 639, 48, 667, 49, 684, 0);
  triangle(661, 33, 682, 96, 768, 49);
}