class Book{
  /*
   * GENERAL
  */
  
  PFont brandonGrotesqueBlack24;
  PFont brandonGrotesqueBlack14;
  PFont brandonGrotesqueReg14;
  PFont brandonGrotesqueReg12;
  
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
  PImage placeholder;
  
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
      //int tempNumberOfPages,
      String tempReferenceNumber,
      String tempDescription){
      //JSONObject tempImages)
          name = tempName;
          subName = "FIX DIT OOIT";
          author = tempAuthor;
          collaborators = tempCollaborators;
          editor = tempEditor;
          language = tempLanguage;
          locationInLibrary = tempLocationInLibrary;
          date = tempDate;
          //dimensions = tempDimensions;
          //numberOfPages = tempNumberOfPages;
          referenceNumber = tempReferenceNumber;
          description = tempDescription;
          //images = tempImages;
    
      // Other stuff
      brandonGrotesqueBlack24 = createFont("Brandon_blk.otf", 24);
      brandonGrotesqueBlack14 = createFont("Brandon_blk.otf", 14);
      brandonGrotesqueReg14 = createFont("Brandon_reg.otf", 14);
      brandonGrotesqueReg12 = createFont("Brandon_reg.otf", 12);
  }
  
  void showBookDetails(){
    fill(cBlack);
    
    textFont(brandonGrotesqueBlack24);
    text(name, xSecondScreen + 258, 223, 274, 70);
    
    textFont(brandonGrotesqueBlack14);
    text(subName, xSecondScreen + 258, 293, 274, 42);
    
    textFont(brandonGrotesqueReg12);
    text(description, xSecondScreen + 258, 583, 274, 111);
    
    // First column
    int xFirstColumn = 218;
    textAlign(RIGHT);
    
    textFont(brandonGrotesqueReg14);
    text("Author:", xSecondScreen + xFirstColumn, 356);
    
    textFont(brandonGrotesqueReg14);
    text("Editor:", xSecondScreen + xFirstColumn, 376);
    
    textFont(brandonGrotesqueReg14);
    text("Language:", xSecondScreen + xFirstColumn, 396);
    
    textFont(brandonGrotesqueReg14);
    text("Publication year:", xSecondScreen + xFirstColumn, 416);
    
    textFont(brandonGrotesqueReg14);
    text("Reference number:", xSecondScreen + xFirstColumn, 436);
    
    // Second column
    int xSecondColumn = 258;
    textAlign(LEFT);

    textFont(brandonGrotesqueReg14);
    text(author, xSecondScreen + xSecondColumn, 356);
    
    textFont(brandonGrotesqueReg14);
    text(editor, xSecondScreen + xSecondColumn, 376);
    
    textFont(brandonGrotesqueReg14);
    text(language, xSecondScreen + xSecondColumn, 396);
    
    textFont(brandonGrotesqueReg14);
    //text(date, xSecondScreen + xSecondColumn, 416);
    
    textFont(brandonGrotesqueReg14);
    //text(referenceNumber, xSecondScreen + xSecondColumn, 436);
    
    // Images
    //showBookImages();
  }
  
  // Placeholder
  void showBookImages(){
    image(placeholder, xSecondScreen + 619, 80, 581, 529);
  }
}
