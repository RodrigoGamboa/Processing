void setup()
{
  size(500, 600);
  //If Table has Header ("data.csv", "header")
  //Table t = loadTable("data_without_headers.csv");  //Use this if your data file doesn't have headers
  Table t = loadTable("data.csv", "headers");  //Use this if your file have headers

  for (int i = 0; i < t.getRowCount(); i++)
  {
    TableRow row = t.getRow(i);
    
    //Extracting the info of data without headers
    float x = row.getFloat(0);
    float y = row.getFloat(1);
    float w = row.getFloat(2);
    float h = row.getFloat(3);
    
    //Extracting the info of data with headers
    /*
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    float w = row.getFloat("w");
    float h = row.getFloat("h");
    */
    
    //fill(x/2 * i, x/3 * 3 * i, 2 * x * i);
    rect(x, y, w, h);
  }
}

void draw()
{
  
}