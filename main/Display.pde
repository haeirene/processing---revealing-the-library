class Display{
  color cWhite = color(255, 255, 255);
  color cBlack = color(54, 54, 54);
  
  PFont brandonGrotesqueBold40;
  PFont brandonGrotesqueBold18;
  PFont brandonGrotesqueRegular10;
  PFont brandonGrotesqueRegular12;
  PFont brandonGrotesqueRegular16;
  PFont brandonGrotesqueRegular18;
  
  PImage placeholder;
  
  void initialize(){
    brandonGrotesqueBold40 = createFont("Brandon_bld.otf", 40);
    brandonGrotesqueBold18 = createFont("Brandon_bld.otf", 18);
    brandonGrotesqueRegular10 = createFont("Brandon_reg.otf", 10);
    brandonGrotesqueRegular12 = createFont("Brandon_reg.otf", 12);
    brandonGrotesqueRegular16 = createFont("Brandon_reg.otf", 16);
    brandonGrotesqueRegular18 = createFont("Brandon_reg.otf", 18);
    
    //placeholder = loadImage("images/bookcase.png");
  }
  
  void show(){
    initialize();
    showFirstColumn();
    showSecondColumn();
  }
  
  /*
   * FIRST COLUMN
  */
  void showFirstColumn(){
    fill(cBlack);
    textFont(brandonGrotesqueBold40);
    text("VISUALIZING THE LIBRARY", 81, 214, 320, 97);
    
    textFont(brandonGrotesqueRegular12);
    text("A selection of 24 books was picked out of the collections ‘old Library’ and ‘special editions’. Both these collections contain vulnerable and valuable books: because of their uniqueness, age, physical fragility or even economical value.", 81, 345, 321, 360);
  }
  
  void showSecondColumn(){
    /*
     * GENERAL
    */
    textFont(brandonGrotesqueBold18);
    //text(string, x1, y1, x2, y2)
    text("FILTER", 481, 224);
    
    textFont(brandonGrotesqueRegular10);
    text("Filter to see a specific part of the library or use the searchbar to look for a specific book.", 481, 288, 800, 321);
    
    /*
     * PART A
    */
    int secondColumnAx = 481;
    
    textFont(brandonGrotesqueBold18);
    text("By subject", secondColumnAx, 357);
    
    textFont(brandonGrotesqueRegular16);
    text("archeology", secondColumnAx, 422);
    
    textFont(brandonGrotesqueRegular16);
    text("cartography", secondColumnAx, 448);
    
    textFont(brandonGrotesqueRegular16);
    text("exhibitions", secondColumnAx, 474);
    
    textFont(brandonGrotesqueRegular16);
    text("graphic design", secondColumnAx, 500);
    
    textFont(brandonGrotesqueRegular16);
    text("info. design", secondColumnAx, 526);
    
    textFont(brandonGrotesqueRegular16);
    text("photography", secondColumnAx, 552);
    
    textFont(brandonGrotesqueRegular16);
    text("religion", secondColumnAx, 578);
    
    textFont(brandonGrotesqueRegular16);
    text("typography", secondColumnAx, 604);
    
    /*
     * PART B
    */
    int secondColumnBx = 661;
  
    textFont(brandonGrotesqueBold18);
    text("By characteristic", secondColumnBx, 357);
    
    textFont(brandonGrotesqueRegular16);
    text("alphabetical by author", secondColumnBx, 422);
    
    textFont(brandonGrotesqueRegular16);
    text("alphabetical by book", secondColumnBx, 448);
    
    textFont(brandonGrotesqueRegular16);
    text("color", secondColumnBx, 474);
    
    textFont(brandonGrotesqueRegular16);
    text("location in library", secondColumnBx, 500);
    
    textFont(brandonGrotesqueRegular16);
    text("location of publication", secondColumnBx, 526);
    
    textFont(brandonGrotesqueRegular16);
    text("date of publication", secondColumnBx, 552);
    
    noFill();
    strokeWeight(0.5);
    strokeCap(SQUARE);
    stroke(cBlack);
    rect(480, 684, 320, 36);
    
    /*
     * THIRD COLUMN
    */
    
    //image(placeholder, 881, 241, 320, 457);
  }
}
