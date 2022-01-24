class Display{
  color cWhite = color(255, 255, 255);
  color cBlack = color(54, 54, 54);
  
  PFont brandonGrotesqueBlack40;
  PFont brandonGrotesqueBlack24;
  PFont brandonGrotesqueBold19;
  PFont brandonGrotesqueBold16;
  PFont brandonGrotesqueRegular13;
  PFont brandonGrotesqueRegular16;
  PFont brandonGrotesqueRegular18;
  
  PImage placeholder;
  
  /*
   * FILTERS
  */
  
  // Second column part 1 -- start
  int secondColumnAx = 480;
  int secondColumnAwidth = secondColumnAx + 50;
  int secondColumnBx = 670;
  int secondColumnBwidth = secondColumnBx + 50;
  
  int filterArcheologyX = secondColumnBx;
  int filterArcheologyY = 364;
  int filterArcheologyWidth = secondColumnAwidth;
  boolean isFilterArcheology = false;
  
  int filterCartographyX = secondColumnBx;
  int filterCartographyY = 390;
  int filterCartographyWidth = secondColumnAwidth;
  boolean isFilterCartography = false;
  
  int filterExhibitionsX = secondColumnBx;
  int filterExhibitionsY = 416;
  int filterExhibitionsWidth = secondColumnAwidth;
  boolean isFilterExhibitions = false;
  
  int filterGraphicDesignX = secondColumnBx;
  int filterGraphicDesignY = 442;
  int filterGraphicDesignWidth = secondColumnAwidth;
  boolean isFilterGraphicDesign = false;
  
  int filterInfoDesignX = secondColumnBx;
  int filterInfoDesignY = 468;
  int filterInfoDesignWidth = secondColumnAwidth;
  boolean isFilterInfoDesign = false;
  
  int filterPhotographyX = secondColumnBx;
  int filterPhotographyY = 494;
  int filterPhotographyWidth = secondColumnAwidth;
  boolean isFilterPhotography = false;
  
  int filterReligionX = secondColumnBx;
  int filterReligionY = 520;
  int filterReligionWidth = secondColumnAwidth;
  boolean isFilterReligion = false;
  
  int filterTypographyX = secondColumnBx;
  int filterTypographyY = 546;
  int filterTypographyWidth = secondColumnAwidth;
  boolean isFilterTypography = false;
  
  // Second column part 1 -- end
  // Second column part 2 -- start
  
  int filterAlphabeticalByAuthorX = secondColumnBx;
  int filterAlphabeticalByAuthorY = 364;
  int filterAlphabeticalByAuthorWidth = secondColumnBwidth;
  boolean isFilterAlphabeticalByAuthor = false;
  
  int filterAlphabeticalByBookX = secondColumnBx;
  int filterAlphabeticalByBookY = 390;
  int filterAlphabeticalByBookWidth = secondColumnBwidth;
  boolean isFilterAlphabeticalByBook = false;
  
  int filterByColorX = secondColumnBx;
  int filterByColorY = 416;
  int filterByColorWidth = secondColumnBwidth;
  boolean isFilterByColor = false;
  
  int filterByLanguageX = secondColumnBx;
  int filterByLanguageY = 442;
  int filterByLanguageWidth = secondColumnBwidth;
  boolean isFilterByLanguage = false;
  
  int filterByLocationInLibraryX = secondColumnBx;
  int filterByLocationInLibraryY = 468;
  int filterByLocationInLibraryWidth = secondColumnBwidth;
  boolean isFilterByLocationInLibrary = false;
  
  int filterByYearOfPublicationX = secondColumnBx;
  int filterByYearOfPublicationY = 494;
  int filterByYearOfPublicationWidth = secondColumnBwidth;
  boolean isFilterByYearOfPublication = false;
  
  // Second column part 2 -- end
  
  void initialize(){
    brandonGrotesqueBlack40 = createFont("Brandon_blk.otf", 40);
    brandonGrotesqueBlack24 = createFont("Brandon_blk.otf", 24);
    brandonGrotesqueBold19 = createFont("Brandon_bld.otf", 19);
    brandonGrotesqueBold16 = createFont("Brandon_bld.otf", 16);
    brandonGrotesqueRegular13 = createFont("Brandon_reg.otf", 13);
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
    textFont(brandonGrotesqueBlack40);
    text("VISUALIZING THE LIBRARY", 79, 108, 321, 104);
    
    textFont(brandonGrotesqueRegular13);
    text("A selection of 24 books was picked out of the collections ‘old Library’ and ‘special editions’. Both these collections contain vulnerable and valuable books: because of their uniqueness, age, physical fragility or even economical value.", 79, 234, 321, 379);
  }
  
  void showSecondColumn(){
    /*
     * GENERAL
    */
    textFont(brandonGrotesqueBlack24);
    //text(string, x1, y1, x2, y2)
    text("FILTER", 479, 165);
    
    textFont(brandonGrotesqueRegular13);
    text("Filter to see a specific part of the library or use the searchbar to look for a specific book.", 479, 233, 318, 37);
    
    /*
     * START PART A
    */
  
    textFont(brandonGrotesqueBold19);
    text("By characteristic", secondColumnAx, 307);
    
    displayFiltersByCharacteristique();
    
    /*
     * END OF PART A
     * START PART B
    */
    textFont(brandonGrotesqueBold19);
    text("By subject", secondColumnBx, 307);
    
    textFont(brandonGrotesqueRegular16);
    text("archeology", filterArcheologyX, filterArcheologyY);
    
    textFont(brandonGrotesqueRegular16);
    text("cartography", filterCartographyX, filterCartographyY);
    
    textFont(brandonGrotesqueRegular16);
    text("exhibitions", filterExhibitionsX, filterExhibitionsY);
    
    textFont(brandonGrotesqueRegular16);
    text("graphic design", filterGraphicDesignX, filterGraphicDesignY);
    
    textFont(brandonGrotesqueRegular16);
    text("info. design", filterInfoDesignX, filterInfoDesignY);
    
    textFont(brandonGrotesqueRegular16);
    text("photography", filterPhotographyX, filterPhotographyY);
    
    textFont(brandonGrotesqueRegular16);
    text("religion", filterReligionX, filterReligionY);
    
    textFont(brandonGrotesqueRegular16);
    text("typography", filterTypographyX, filterTypographyY);
    
    noFill();
    strokeWeight(0.5);
    strokeCap(SQUARE);
    stroke(cBlack);
    rect(480, 684, 320, 36);
    
    /*
     * THIRD COLUMN
    */
    
    fill(cBlack);
    noStroke();
    strokeCap(SQUARE);
    rect(878, 284, 323, 10);
    rect(878, 444, 323, 10);
    rect(878, 603, 323, 10);
  }
  
  boolean overText(int textX1, int textY1, int textX2, int textY2){
    if (mouseX >= textX1 &&
        mouseX <= textX2 &&
        mouseY >= textY1 &&
        mouseY <= textY2) {
      return true;
    } else {
      return false;
    }
  }
  
  void updateFilters(){
    /*
     * FILTER BY CATEGORIE
    */
    isFilterArcheology = overText(filterArcheologyX, filterArcheologyY - 8, filterArcheologyWidth , filterArcheologyY + 8);
    isFilterCartography = overText(filterCartographyX, filterCartographyY - 8, filterCartographyWidth, filterCartographyY + 8);
    isFilterExhibitions = overText(filterExhibitionsX, filterExhibitionsY - 8, filterExhibitionsWidth, filterExhibitionsY + 8);
    isFilterGraphicDesign = overText(filterArcheologyX, filterArcheologyY - 8, filterArcheologyWidth, filterArcheologyY + 8);
    isFilterInfoDesign = overText(filterGraphicDesignX, filterGraphicDesignY, filterGraphicDesignWidth, filterGraphicDesignY + 8);
    isFilterPhotography = overText(filterPhotographyX, filterPhotographyY, filterPhotographyWidth, filterPhotographyY + 8);
    isFilterReligion = overText(filterReligionX, filterReligionY, filterReligionWidth, filterReligionY + 8);
    isFilterTypography = overText(filterTypographyX, filterTypographyY, filterTypographyWidth, filterTypographyY + 8);
    
    /*
     * FILTER BY CHARACTERISTIQUE
    */
    isFilterAlphabeticalByAuthor = overText(secondColumnAx , filterAlphabeticalByAuthorY - 8, filterAlphabeticalByAuthorWidth, filterAlphabeticalByAuthorY + 8);
    isFilterAlphabeticalByBook = overText(secondColumnAx, filterAlphabeticalByBookY - 8, filterAlphabeticalByBookWidth, filterAlphabeticalByBookY + 8);
    isFilterByColor = overText(secondColumnAx , filterByColorY - 8, filterByColorWidth , filterByColorY + 8);
    isFilterByLanguage = overText(secondColumnAx , filterByLanguageY - 8, filterByLanguageWidth , filterByLanguageY + 8);
    isFilterByLocationInLibrary = overText(secondColumnAx , filterByLocationInLibraryY - 8, filterByLocationInLibraryWidth, filterByLocationInLibraryY + 8);
    isFilterByYearOfPublication = overText(secondColumnAx , filterByYearOfPublicationY - 8, filterByYearOfPublicationWidth, filterByYearOfPublicationY + 8);
  }
  
  void displayFiltersByCharacteristique(){
    if(isFilterAlphabeticalByAuthor) {
      clearFilter(secondColumnAx, filterAlphabeticalByAuthorY);
      fill(cBlack);
      textFont(brandonGrotesqueBold16);
      text("alphabetical by author", secondColumnAx, filterAlphabeticalByAuthorY);
    }
    else{
      clearFilter(secondColumnAx, filterAlphabeticalByAuthorY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("alphabetical by author", secondColumnAx, filterAlphabeticalByAuthorY);
    }
    
    if(isFilterAlphabeticalByBook) {
      clearFilter(secondColumnAx, filterAlphabeticalByBookY);
      fill(cBlack);
      textFont(brandonGrotesqueBold16);
      text("alphabetical by book", secondColumnAx, filterAlphabeticalByBookY);
    }
    else{
      clearFilter(secondColumnAx, filterAlphabeticalByBookY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("alphabetical by book", secondColumnAx, filterAlphabeticalByBookY);
    }
    
    if(isFilterByColor) {
      clearFilter(secondColumnAx, filterByColorY);
      fill(cBlack);
      textFont(brandonGrotesqueBold16);
      text("color", secondColumnAx, filterByColorY);
    }
    else{
      clearFilter(secondColumnAx, filterByColorY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("color", secondColumnAx, filterByColorY);
    }
    
    if(isFilterByLanguage){
      clearFilter(secondColumnAx, filterByLanguageY);
      fill(cBlack);
      textFont(brandonGrotesqueBold16);
      text("language", secondColumnAx, filterByLanguageY);
    }
    else{
      clearFilter(secondColumnAx, filterByLanguageY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("language", secondColumnAx, filterByLanguageY);
    }
    
    if(isFilterByLocationInLibrary){
      clearFilter(secondColumnAx, filterByLocationInLibraryY);
      fill(cBlack);
      textFont(brandonGrotesqueBold16);
      text("location of publication", secondColumnAx, filterByLocationInLibraryY);
    }
    else{
      clearFilter(secondColumnAx, filterByLocationInLibraryY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("location of publication", secondColumnAx, filterByLocationInLibraryY);
    }
    
    if(isFilterByYearOfPublication){
      clearFilter(secondColumnAx, filterByYearOfPublicationY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("year of publication", secondColumnAx, filterByYearOfPublicationY);
    }
    else{
      clearFilter(secondColumnAx, filterByYearOfPublicationY);
      fill(cBlack);
      textFont(brandonGrotesqueRegular16);
      text("year of publication", secondColumnAx, filterByYearOfPublicationY);
    }
    
    //updateFilteredBooks();
  }
  
  void clearFilter(int tempX, int tempY){
    fill(cWhite);
    noStroke();
    rect(tempX, tempY, 50, 16);
  }
}
