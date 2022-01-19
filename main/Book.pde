class Book{
  /*
   * GENERAL
  */
  
  PFont brandonGrotesqueBlack24;
  PFont brandonGrotesqueBold19;
  PFont brandonGrotesqueReg16;
  PFont brandonGrotesqueReg13;
  
  color cWhite = color(255, 255, 255);
  color cBlack = color(54, 54, 54);
  
  /*
   * BOOK
  */
  String name;
  String subName;
  String author;
  String collaborators;
  String editor;
  String language;
  String locationInLibrary;
  int date;
  JSONObject dimensions = new JSONObject();
  int numberOfPages;
  String referenceNumber;
  String description;
  JSONObject images = new JSONObject();
  
  PImage coverImg;
  PGraphics coverGraphics;
  PImage btnLeft;
  PImage btnRight;
  
  // Specific constructor
  Book(String tempName,
      String tempSubName,
      String tempAuthor,
      String tempCollaborators,
      String tempEditor,
      String tempLanguage,
      String tempLocationInLibrary,
      int tempDate,
      //JSONObject tempDimensions,
      int tempNumberOfPages,
      String tempReferenceNumber,
      String tempDescription){
      //JSONObject tempImages)
          name = tempName;
          subName = tempSubName;
          author = tempAuthor;
          collaborators = tempCollaborators;
          editor = tempEditor;
          language = tempLanguage;
          locationInLibrary = tempLocationInLibrary;
          date = tempDate;
          //dimensions = tempDimensions;
          numberOfPages = tempNumberOfPages;
          referenceNumber = tempReferenceNumber;
          description = tempDescription;
          //images = tempImages;
      
      //coverGraphics = createGraphics();
      btnLeft = loadImage("images/btn_left.png");
      btnRight = loadImage("images/btn_right.png");
    
      // Other stuff
      brandonGrotesqueBlack24 = createFont("Brandon_blk.otf", 24);
      brandonGrotesqueBold19 = createFont("Brandon_bld.otf", 19);
      brandonGrotesqueReg16 = createFont("Brandon_reg.otf", 16);
      brandonGrotesqueReg13 = createFont("Brandon_reg.otf", 13);
  }
  
  void showBookDetails(){
    fill(cBlack);
    
    textFont(brandonGrotesqueBlack24);
    text(name, xSecondScreen + 258, 223, 274, 70);
    
    textFont(brandonGrotesqueBold19);
    text(subName, xSecondScreen + 258, 293, 274, 42);
    
    textFont(brandonGrotesqueReg13);
    text(description, xSecondScreen + 258, 583, 274, 111);
    
    // First column
    int xFirstColumn = 218;
    textAlign(RIGHT);
    
    textFont(brandonGrotesqueReg16);
    text("Author:", xSecondScreen + xFirstColumn, 356);
    
    textFont(brandonGrotesqueReg16);
    text("Editor:", xSecondScreen + xFirstColumn, 376);
    
    textFont(brandonGrotesqueReg16);
    text("Language:", xSecondScreen + xFirstColumn, 396);
    
    textFont(brandonGrotesqueReg16);
    text("Publication year:", xSecondScreen + xFirstColumn, 416);
    
    textFont(brandonGrotesqueReg16);
    text("Reference number:", xSecondScreen + xFirstColumn, 436);
    
    // Second column
    int xSecondColumn = 258;
    textAlign(LEFT);

    textFont(brandonGrotesqueReg16);
    text(author, xSecondScreen + xSecondColumn, 356);
    
    textFont(brandonGrotesqueReg16);
    text(editor, xSecondScreen + xSecondColumn, 376);
    
    textFont(brandonGrotesqueReg16);
    text(language, xSecondScreen + xSecondColumn, 396);
    
    textFont(brandonGrotesqueReg16);
    text(date, xSecondScreen + xSecondColumn, 416);
    
    textFont(brandonGrotesqueReg16);
    text(referenceNumber, xSecondScreen + xSecondColumn, 436);
    
    // Images
    showBookImages();
  }
  
  // Placeholder
  void showBookImages(){
    //image(placeholder, xSecondScreen + 619, 80, 581, 529);
    fill(cBlack);
    noStroke();
    
    //main image
    rect(1933, 80, 452, 452);
    
    //next images
    int smallRectSize = 70;
    int smallRectX = 2410;
    rect(smallRectX, 80, smallRectSize, smallRectSize);
    rect(smallRectX, 176, smallRectSize, smallRectSize);
    rect(smallRectX, 271, smallRectSize, smallRectSize);
    rect(smallRectX, 367, smallRectSize, smallRectSize);
    rect(smallRectX, 462, smallRectSize, smallRectSize);
    
    //navigation
    image(btnLeft, 1935, 588, 8, 16);
    image(btnRight, 2004, 588, 8, 16);
  }
}
