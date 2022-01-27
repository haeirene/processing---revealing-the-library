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
  color colorOfBook;
  String strColorOfBook;
  int numberOfPages;
  String referenceNumber;
  String description;
  JSONObject images = new JSONObject();
  
  int currentIndexImages = 0;
  int positionX;
  int positionY;
  int smallRectSize = 70;
  int smallRectX = 2410;
  
  PImage mainImg;
  PImage firstSquareImg;
  PImage secondSquareImg;
  PImage thirdSquareImg;
  PImage fourthSquareImg;
  PImage fifthSquareImg;
  
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
      String tempColorOfBook,
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
          strColorOfBook = tempColorOfBook;
          numberOfPages = tempNumberOfPages;
          referenceNumber = tempReferenceNumber;
          description = tempDescription;
          images = tempImages;
      
      //coverGraphics = createGraphics();
      colorOfBook = Integer.parseInt(strColorOfBook, 16);
      colorOfBook = color(red(colorOfBook), green(colorOfBook), blue(colorOfBook));
      
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
        
        //Other squares
        mainImg = coverImg;
        firstSquareImg = backImg;
        secondSquareImg = d0Img;
        thirdSquareImg = d1Img;
        fourthSquareImg = d2Img;
        fifthSquareImg = d3Img;
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
      image(mainImg, xSecondScreen + 653, 80, 452, 452);
      
      //Navigation
      image(firstSquareImg, smallRectX, 80, smallRectSize, smallRectSize);
      image(secondSquareImg, smallRectX, 176, smallRectSize, smallRectSize);
      image(thirdSquareImg, smallRectX, 271, smallRectSize, smallRectSize);
      image(fourthSquareImg, smallRectX, 367, smallRectSize, smallRectSize);
      image(fifthSquareImg, smallRectX, 462, smallRectSize, smallRectSize);
    }
    else{
      rect(1933, 80, 452, 452);
      rect(smallRectX, 80, smallRectSize, smallRectSize);
      rect(smallRectX, 176, smallRectSize, smallRectSize);
      rect(smallRectX, 271, smallRectSize, smallRectSize);
      rect(smallRectX, 367, smallRectSize, smallRectSize);
      rect(smallRectX, 462, smallRectSize, smallRectSize);
    }
    
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
    fill(colorOfBook);
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
    PImage tempMainImg;
    PImage tempFirstSquareImg;
    PImage tempSecondSquareImg;
    PImage tempThirdSquareImg;
    PImage tempFourthSquareImg;
    PImage tempFifthSquareImg;
    
    if(isLeft){
      currentIndexImages--;
    }
    if(isRight){
      currentIndexImages++;
    }
    
    if(currentIndexImages < 0){
      currentIndexImages = 11;
    }
    if(currentIndexImages > 11){
      currentIndexImages = 0;
    }
    
    switch(currentIndexImages){
      case 0:
        tempMainImg = coverImg;
        tempFirstSquareImg = backImg;
        tempSecondSquareImg = d0Img;
        tempThirdSquareImg = d1Img;
        tempFourthSquareImg = d2Img;
        tempFifthSquareImg = d3Img;
        break;
      case 1:
        tempMainImg = backImg;
        tempFirstSquareImg = d0Img;
        tempSecondSquareImg = d1Img;
        tempThirdSquareImg = d2Img;
        tempFourthSquareImg = d3Img;
        tempFifthSquareImg = d4Img;
        break;
      case 2:
        tempMainImg = d0Img;
        tempFirstSquareImg = d1Img;
        tempSecondSquareImg = d2Img;
        tempThirdSquareImg = d3Img;
        tempFourthSquareImg = d4Img;
        tempFifthSquareImg = d5Img;
        break;
      case 3:
        tempMainImg = d1Img;
        tempFirstSquareImg = d2Img;
        tempSecondSquareImg = d3Img;
        tempThirdSquareImg = d4Img;
        tempFourthSquareImg = d5Img;
        tempFifthSquareImg = d6Img;
        break;
      case 4:
        tempMainImg = d2Img;
        tempFirstSquareImg = d3Img;
        tempSecondSquareImg = d4Img;
        tempThirdSquareImg = d5Img;
        tempFourthSquareImg = d6Img;
        tempFifthSquareImg = d7Img;
        break;
      case 5:
        tempMainImg = d3Img;
        tempFirstSquareImg = d4Img;
        tempSecondSquareImg = d5Img;
        tempThirdSquareImg = d6Img;
        tempFourthSquareImg = d7Img;
        tempFifthSquareImg = d8Img;
        break;
      case 6:
        tempMainImg = d4Img;
        tempFirstSquareImg = d5Img;
        tempSecondSquareImg = d6Img;
        tempThirdSquareImg = d7Img;
        tempFourthSquareImg = d8Img;
        tempFifthSquareImg = d9Img;
        break;
      case 7:
        tempMainImg = d5Img;
        tempFirstSquareImg = d6Img;
        tempSecondSquareImg = d7Img;
        tempThirdSquareImg = d8Img;
        tempFourthSquareImg = d9Img;
        tempFifthSquareImg = coverImg;
        break;
      case 8:
        tempMainImg = d6Img;
        tempFirstSquareImg = d7Img;
        tempSecondSquareImg = d8Img;
        tempThirdSquareImg = d9Img;
        tempFourthSquareImg = coverImg;
        tempFifthSquareImg = backImg;
        break;
      case 9:
        tempMainImg = d7Img;
        tempFirstSquareImg = d8Img;
        tempSecondSquareImg = d9Img;
        tempThirdSquareImg = coverImg;
        tempFourthSquareImg = backImg;
        tempFifthSquareImg = d0Img;
        break;
      case 10:
        tempMainImg = d8Img;
        tempFirstSquareImg = d9Img;
        tempSecondSquareImg = coverImg;
        tempThirdSquareImg = backImg;
        tempFourthSquareImg = d0Img;
        tempFifthSquareImg = d1Img;
        break;
      case 11:
        tempMainImg = d9Img;
        tempFirstSquareImg = coverImg;
        tempSecondSquareImg = backImg;
        tempThirdSquareImg = d0Img;
        tempFourthSquareImg = d1Img;
        tempFifthSquareImg = d2Img;
        break;
      default:
        tempMainImg = coverImg;
        tempFirstSquareImg = backImg;
        tempSecondSquareImg = d0Img;
        tempThirdSquareImg = d1Img;
        tempFourthSquareImg = d2Img;
        tempFifthSquareImg = d3Img;
    }
    
    mainImg = tempMainImg;
    firstSquareImg = tempFirstSquareImg;
    secondSquareImg = tempSecondSquareImg;
    thirdSquareImg = tempThirdSquareImg;
    fourthSquareImg = tempFourthSquareImg;
    fifthSquareImg = tempFifthSquareImg;
  }
}
