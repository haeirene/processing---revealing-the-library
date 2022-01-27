import spout.*;
import oscP5.*; // Library of Andreas Schleger
import netP5.*; // Already included in Processing

/*
 * DISPLAY DESIGN
*/

int startDrawingX = 878;
int startDrawingY = 444;

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

// Kinect Azure
OscP5 oscP5;
NetAddress myRemoteLocation;

int handPositionX;
int handPositionY;

// Spout
Spout spout;

// Screen size
int xFirstScreen = 0;
int xSecondScreen = 1280;
//int xSecondScreen = 0;

int screenWidth = 1280;
int screenHeight = 800;

void setup(){
  //1280 * 2 = 2560
  size(2560, 800, P3D);
  
  /*
   * DISPLAY DESIGN
  */
  
  design = new Display();
  
  json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/bookName");
  jBooks = json.getJSONArray("listOfBooks");
  
  for (int i = 0; i < jBooks.size(); i++) {
    JSONObject tempBook = jBooks.getJSONObject(i);
    
    //First book to show
    if(i == 0){
        currentBook = new Book(
          tempBook.getString("name"),
          tempBook.getString("subtitle"),
          tempBook.getString("author"),
          tempBook.getString("collaborators"),
          tempBook.getString("editor"),
          tempBook.getString("language"),
          tempBook.getString("location_in_library"),
          tempBook.getInt("date"),
          tempBook.getJSONObject("dimensions"),
          tempBook.getString("color_of_book"),
          tempBook.getInt("number_of_pages"),
          tempBook.getString("reference_number"),
          tempBook.getString("description"),
          tempBook.getJSONObject("images")
          );
    }
    
    filteredBooks[i] = new Book(
      tempBook.getString("name"),
      tempBook.getString("subtitle"),
      tempBook.getString("author"),
      tempBook.getString("collaborators"),
      tempBook.getString("editor"),
      tempBook.getString("language"),
      tempBook.getString("location_in_library"),
      tempBook.getInt("date"),
      tempBook.getJSONObject("dimensions"),
      tempBook.getString("color_of_book"),
      tempBook.getInt("number_of_pages"),
      tempBook.getString("reference_number"),
      tempBook.getString("description"),
      tempBook.getJSONObject("images")
    );
    
    filteredBooks[i].calculatePosition(filteredBooks[i].dimensions.getInt("height"), filteredBooks[i].dimensions.getInt("width_spine")); 
    //tempBook.setString("name", jBooks[i]["name"]);
    
    //println(filteredBooks[i].dimensions.getInt("width"));
  }
  
  /*
   * HARDWARE
  */
  oscP5 = new OscP5(this, 10000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1", 10000);
  
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
  
  for (int i = 0; i < filteredBooks.length; i++) {
    filteredBooks[i].displayBook();
  }
  
  currentBook.showBookDetails();
  
  //At the end
  spout.sendTexture();
}

void mousePressed() {
  boolean isCharacteristique = false;
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
    isCharacteristique = true;
    println("klik alphabetical by author" + design.isFilterAlphabeticalByAuthor);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books");
  }

  if(design.isFilterAlphabeticalByBook) {
    isCharacteristique = true;
    println("klik alphabetical by book" + design.isFilterAlphabeticalByBook);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/bookName");
  }
  
  if(design.isFilterByColor) {
    isCharacteristique = true;
    println("klik by color" + design.isFilterByColor);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books");
  }
  
  if(design.isFilterByHeight) {
    isCharacteristique = true;
    println("klik by height" + design.isFilterByHeight);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/height");
  }
  
  if(design.isFilterByLanguage) {
    isCharacteristique = true;
    println("klik by language" + design.isFilterByLanguage);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/language");
  }
  
  if(design.isFilterByWidth) {
    isCharacteristique = true;
    println("klik by location in width" + design.isFilterByLocationInLibrary);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/width");
  }
  
    if(design.isFilterByLocationInLibrary) {
    isCharacteristique = true;
    println("klik by location in library" + design.isFilterByLocationInLibrary);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/locationInLibrary");
  }
  
  if(design.isFilterByYearOfPublication) {
    isCharacteristique = true;
    println("klik by year of publication" + design.isFilterByYearOfPublication);
    json = loadJSONObject("https://hi---revealing-the-library.herokuapp.com/books/sort/dateOfPublication");
  }
  
  // Don't call this unnecessary, as this is intensive.
  if(isCharacteristique){
    updateFilteredBooks();
  }

  
  for(int i = 0; i < filteredBooks.length; i++){
    if(filteredBooks[i].overBook()){
      println("click book " + filteredBooks[i].name);
      currentBook = filteredBooks[i];
      
      // Update information
      fill(cWhite);
      noStroke();
      rect(1280, 0, 1280, 800);
      currentBook.showBookDetails();
    }
  }
  
  if(currentBook.overLeft()){
    currentBook.updateBookImages(currentBook.overLeft(), currentBook.overRight());
  }
  
  if(currentBook.overRight()){
    currentBook.updateBookImages(currentBook.overLeft(), currentBook.overRight());
  }
}

void oscEvent(OscMessage theOscMessage){
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: " + theOscMessage.addrPattern());
  println(" typetag: " + theOscMessage.typetag());
  println(theOscMessage.get(0).floatValue());
  
  int handPositionX;
  int handPositionY;
}

void updateFilteredBooks(){
  println("api magic");
  jBooks = json.getJSONArray("listOfBooks");
  
  startDrawingX = 878;
  startDrawingY = 444;
  
  for (int i = 0; i < jBooks.size(); i++) {
    JSONObject tempBook = jBooks.getJSONObject(i);
    
    filteredBooks[i] = new Book(
      tempBook.getString("name"),
      tempBook.getString("subtitle"),
      tempBook.getString("author"),
      tempBook.getString("collaborators"),
      tempBook.getString("editor"),
      tempBook.getString("language"),
      tempBook.getString("location_in_library"),
      tempBook.getInt("date"),
      tempBook.getJSONObject("dimensions"),
      tempBook.getString("color_of_book"),
      tempBook.getInt("number_of_pages"),
      tempBook.getString("reference_number"),
      tempBook.getString("description"),
      tempBook.getJSONObject("images")
    );
    
  filteredBooks[i].calculatePosition(filteredBooks[i].dimensions.getInt("height"), filteredBooks[i].dimensions.getInt("width_spine"));
  }
}
