import org.openkinect.processing.*;
import spout.*;

/*
 * DISPLAY DESIGN
*/

Display design;
color cWhite = color(255, 255, 255);
color cBlack = color(54, 54, 54);
Book[] filteredBooks = new Book[25];
Book currentBook;

JSONObject json;
JSONArray jBooks;

/*
 * HARDWARE
*/

// Kinect
Kinect kinect;

int depthValueKinect = 2048;
int rx;
int ry;
int skip = 1;

float minThresh = 240;
float maxThresh = 469;

PImage img;
PGraphics finalImg;

// Spout
Spout spout;

// Screen size
int xFirstScreen = 0;
//int xSecondScreen = 1280;
int xSecondScreen = 0;

int screenWidth = 1280;
int screenHeight = 800;

void setup(){
  //1280 * 2 = 2560
  size(1280, 800, P3D);
  
  /*
   * DISPLAY DESIGN
  */
  
  design = new Display();
  
  json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/bookName");
  jBooks = json.getJSONArray("listOfBooks");
  
  for (int i = 0; i < json.size(); i++) {
    JSONObject tempBook = jBooks.getJSONObject(i);
    
    //First book to show
    if(i == 0){
        currentBook = new Book(
          tempBook.getString("name"),
          tempBook.getString("name"),
          tempBook.getString("author"),
          tempBook.getString("collaborators"),
          tempBook.getString("editor"),
          tempBook.getString("language"),
          tempBook.getString("locationInLibrary"),
          tempBook.getInt("date"),
          //tempBook.getJSONObject("dimensions"),
          //tempBook.getInt("numberOfPages"),
          tempBook.getString("referenceNumber"),
          tempBook.getString("description")
          //tempBook.getJSONObject("images")
          );
    }
    
    filteredBooks[i] = new Book(
      tempBook.getString("name"),
      tempBook.getString("name"),
      tempBook.getString("author"),
      tempBook.getString("collaborators"),
      tempBook.getString("editor"),
      tempBook.getString("language"),
      tempBook.getString("locationInLibrary"),
      tempBook.getInt("date"),
      //tempBook.getJSONObject("dimensions"),
      //tempBook.getInt("numberOfPages"),
      tempBook.getString("referenceNumber"),
      tempBook.getString("description")
      //tempBook.getJSONObject("images")
    );
    //tempBook.setString("name", jBooks[i]["name"]);
  }
  
  println(json.size());
  
  /*
   * HARDWARE
  */
  //finalImg = createGraphics(1280, 800, JAVA2D);
  
  //kinect = new Kinect (this);
  //kinect.initDepth();
  
  spout = new Spout(this);
  spout.createSender("main");
}

void draw(){
  /*
   * DISPLAY DESIGN
  */
  
  background(cWhite);

  design.show();
  design.updateFilters();
  //currentBook.showBookDetails();
  
  /*
   * KINECT
  */
  
  // Get the raw depth as array of integers
  /*int[] depth = kinect.getRawDepth();
  
  finalImg.beginDraw();
  finalImg.loadPixels();
  
  //int record = 2048;
  int record = finalImg.height;
  rx = 0;
  ry = 0;
    
  for (int x = 0; x < finalImg.width; x += skip) {
    for (int y = 0; y < finalImg.height; y += skip) {
      int ty = int(map(y, 0, finalImg.height, 0, kinect.height));
      int tx = int(map(x, 0, finalImg.width, 0, kinect.width));
      int offset = ty * kinect.width + tx;
      float d = depth[offset];
      
      // Debug visualisation
      if (d > minThresh && d < maxThresh && x > 75) {
        if(y < record){
          record = y;
          rx = width - x;
          //rx = x;
          ry = y;
        }
      }
    }
  }
  
  finalImg.updatePixels();
  
  //fill(255, 0, 150);
  //ellipse(rx, ry, 32, 32);*/
  
  //At the end
  spout.sendTexture();
}

void mousePressed() {
  /*
   * FILTER BY CATEGORIE
  */
  if(design.isFilterArcheology) {
    println("klik archeology" + design.isFilterArcheology);
  }
  if(design.isFilterCartography) {
    println("klik cartography" + design.isFilterCartography);
  }
  if(design.isFilterExhibitions) {
    println("klik exhibitions" + design.isFilterExhibitions);
  }
  if(design.isFilterGraphicDesign) {
    println("klik graphic design" + design.isFilterGraphicDesign);
  }
  if(design.isFilterInfoDesign) {
    println("klik info design" + design.isFilterInfoDesign);
  }
  if(design.isFilterPhotography) {
    println("klik photography" + design.isFilterPhotography);
  }
  if(design.isFilterReligion) {
    println("klik religion" + design.isFilterReligion);
  }
  if(design.isFilterTypography) {
    println("klik typography" + design.isFilterTypography);
  }
  
  /*
   * FILTER BY CHARACTERISTIQUE
  */
  if(design.isFilterAlphabeticalByAuthor) {
    println("klik typography" + design.isFilterAlphabeticalByAuthor);
  }
  if(design.isFilterAlphabeticalByBook) {
    println("klik typography" + design.isFilterAlphabeticalByBook);
  }
  if(design.isFilterByColor) {
    println("klik typography" + design.isFilterByColor);
  }
  if(design.isFilterByLanguage) {
    println("klik typography" + design.isFilterByLanguage);
  }
  if(design.isFilterByLocationInLibrary) {
    println("klik typography" + design.isFilterByLocationInLibrary);
  }
  if(design.isFilterByYearOfPublication) {
    println("klik typography" + design.isFilterByYearOfPublication);
  }
}
