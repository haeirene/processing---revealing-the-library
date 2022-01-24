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
  
  int currentIndexImages = 0;
  int positionX;
  int positionY;
  
  PImage coverImg;
  PImage backImg;
  PImage d0Img;
  PImage d1Img;
  PImage d2Img;
  PImage d3Img;
  PImage d4Img;
  PImage d5Img;
  PImage d6Img;
  PImage d7Img;
  PImage d8Img;
  PImage d9Img;
  
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
      JSONObject tempDimensions,
      int tempNumberOfPages,
      String tempReferenceNumber,
      String tempDescription,
      JSONObject tempImages){
          name = tempName;
          subName = tempSubName;
          author = tempAuthor;
          collaborators = tempCollaborators;
          editor = tempEditor;
          language = tempLanguage;
          locationInLibrary = tempLocationInLibrary;
          date = tempDate;
          dimensions = tempDimensions;
          numberOfPages = tempNumberOfPages;
          referenceNumber = tempReferenceNumber;
          description = tempDescription;
          images = tempImages;
      
      //coverGraphics = createGraphics();
      if(images.getString("cover").length() != 0){
        coverImg = loadImage("images/" + images.getString("cover"));
        backImg = loadImage("images/" + images.getString("backcover"));
        
        String[] detailed = images.getJSONArray("detailed").getStringArray();
        d0Img = loadImage("images/" + detailed[0]);
        d1Img = loadImage("images/" + detailed[1]);
        d2Img = loadImage("images/" + detailed[2]);
        d3Img = loadImage("images/" + detailed[3]);
        d4Img = loadImage("images/" + detailed[4]);
        d5Img = loadImage("images/" + detailed[5]);
        d6Img = loadImage("images/" + detailed[6]);
        d7Img = loadImage("images/" + detailed[7]);
        d8Img = loadImage("images/" + detailed[8]);
        d9Img = loadImage("images/" + detailed[9]);
      }
      
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
    fill(cBlack);
    noStroke();
    
    //main image
    if(images.getString("cover").length() != 0){
      image(coverImg, xSecondScreen + 653, 80, 452, 452);
    }
    else{
      rect(1933, 80, 452, 452);
    }
    //image(placeholder, xSecondScreen + 619, 80, 452, 452);
    
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
  
  void calculatePosition(int heightBook, int widthSpine){
    positionX = startDrawingX;
    positionY = startDrawingY - heightBook * 3;
      
    startDrawingX += (widthSpine * 3);
        
    if(startDrawingX >= 1199){
      startDrawingX = 0;
      startDrawingY = 603;
    }
  }
  
  void displayBook(){
    noFill();
    strokeWeight(1);
    stroke(cBlack);
        
    //878x - 1199
    rect(positionX, positionY, dimensions.getInt("width_spine") * 3, dimensions.getInt("height") * 3);
  }
  
  boolean overBook(){
    if ((mouseX >= positionX) &&
        (mouseX <= (positionX + (dimensions.getInt("width_spine") * 3))) &&
        mouseY >= positionY &&
        (mouseY <= (positionY + (dimensions.getInt("height") * 3)))) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean overLeft(){
    if (mouseX >= 1935 &&
        mouseX <= 1935 + 8 &&
        mouseY >= 588 &&
        mouseY <= 588 + 16) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean overRight(){
    if (mouseX >= 2004 &&
        mouseX <= 2004 + 8 &&
        mouseY >= 588 &&
        mouseY <= 588 + 16) {
      return true;
    } else {
      return false;
    }
  }
  
  void updateBookImages(boolean isLeft, boolean isRight){
    PImage tempImg;
    
    if(isLeft){
      currentIndexImages--;
    }
    if(isRight){
      currentIndexImages++;
    }
    if(currentIndexImages < 0 || currentIndexImages > 11){
      currentIndexImages = 0;
    }
    
    switch(currentIndexImages){
      case 0:
        tempImg = coverImg;
        break;
      case 1:
        tempImg = backImg;
        break;
      case 2:
        tempImg = d0Img;
        break;
      case 3:
        tempImg = d1Img;
        break;
      case 4:
        tempImg = d2Img;
        break;
      case 5:
        tempImg = d3Img;
        break;
      case 6:
        tempImg = d4Img;
        break;
      case 7:
        tempImg = d5Img;
        break;
      case 8:
        tempImg = d6Img;
        break;
      case 9:
        tempImg = d7Img;
        break;
      case 10:
        tempImg = d8Img;
        break;
      case 11:
        tempImg = d9Img;
        break;
      default:
        tempImg = coverImg;
    }
    
    image(tempImg, xSecondScreen + 653, 80, 452, 452);
  }
}
