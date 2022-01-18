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
  
  /*
   * FILTERS
  */
  
  // Second column part 1 -- start
  int secondColumnAx = 481;
  int secondColumnAwidth = secondColumnAx + 50;
  
  int filterArcheologyX = secondColumnAx;
  int filterArcheologyY = 422;
  int filterArcheologyWidth = secondColumnAwidth;
  boolean isFilterArcheology = false;
  
  int filterCartographyX = secondColumnAx;
  int filterCartographyY = 448;
  int filterCartographyWidth = secondColumnAwidth;
  boolean isFilterCartography = false;
  
  int filterExhibitionsX = secondColumnAx;
  int filterExhibitionsY = 474;
  int filterExhibitionsWidth = secondColumnAwidth;
  boolean isFilterExhibitions = false;
  
  int filterGraphicDesignX = secondColumnAx;
  int filterGraphicDesignY = 500;
  int filterGraphicDesignWidth = secondColumnAwidth;
  boolean isFilterGraphicDesign = false;
  
  int filterInfoDesignX = secondColumnAx;
  int filterInfoDesignY = 526;
  int filterInfoDesignWidth = secondColumnAwidth;
  boolean isFilterInfoDesign = false;
  
  int filterPhotographyX = secondColumnAx;
  int filterPhotographyY = 552;
  int filterPhotographyWidth = secondColumnAwidth;
  boolean isFilterPhotography = false;
  
  int filterReligionX = secondColumnAx;
  int filterReligionY = 578;
  int filterReligionWidth = secondColumnAwidth;
  boolean isFilterReligion = false;
  
  int filterTypographyX = secondColumnAx;
  int filterTypographyY = 604;
  int filterTypographyWidth = secondColumnAwidth;
  boolean isFilterTypography = false;
  
  // Second column part 1 -- end
  // Second column part 2 -- start
  
  int secondColumnBx = 661;
  int secondColumnBwidth = secondColumnBx + 50;
  
  int filterAlphabeticalByAuthorX = secondColumnBx;
  int filterAlphabeticalByAuthorY = 422;
  int filterAlphabeticalByAuthorWidth = secondColumnBwidth;
  boolean isFilterAlphabeticalByAuthor = false;
  
  int filterAlphabeticalByBookX = secondColumnBx;
  int filterAlphabeticalByBookY = 448;
  int filterAlphabeticalByBookWidth = secondColumnBwidth;
  boolean isFilterAlphabeticalByBook = false;
  
  int filterByColorX = secondColumnBx;
  int filterByColorY = 474;
  int filterByColorWidth = secondColumnBwidth;
  boolean isFilterByColor = false;
  
  int filterByLanguageX = secondColumnBx;
  int filterByLanguageY = 500;
  int filterByLanguageWidth = secondColumnBwidth;
  boolean isFilterByLanguage = false;
  
  int filterByLocationInLibraryX = secondColumnBx;
  int filterByLocationInLibraryY = 526;
  int filterByLocationInLibraryWidth = secondColumnBwidth;
  boolean isFilterByLocationInLibrary = false;
  
  int filterByYearOfPublicationX = secondColumnBx;
  int filterByYearOfPublicationY = 552;
    int filterByYearOfPublicationWidth = secondColumnBwidth;
  boolean isFilterByYearOfPublication = false;
  
  // Second column part 2 -- end
  
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
     * START PART A
    */
    textFont(brandonGrotesqueBold18);
    text("By subject", secondColumnAx, 357);
    
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
    
    /*
     * END OF PART A
     * START PART B
    */
  
    textFont(brandonGrotesqueBold18);
    text("By characteristic", secondColumnBx, 357);
    
    textFont(brandonGrotesqueRegular16);
    text("alphabetical by author", secondColumnBx, filterAlphabeticalByAuthorY);
    
    textFont(brandonGrotesqueRegular16);
    text("alphabetical by book", secondColumnBx, filterAlphabeticalByBookY);
    
    textFont(brandonGrotesqueRegular16);
    text("color", secondColumnBx, filterByColorY);
    
    textFont(brandonGrotesqueRegular16);
    text("language", secondColumnBx, filterByLanguageY);
    
    textFont(brandonGrotesqueRegular16);
    text("location of publication", secondColumnBx, filterByLocationInLibraryY);
    
    textFont(brandonGrotesqueRegular16);
    text("date of publication", secondColumnBx, filterByYearOfPublicationY);
    
    /*
     * END OF PART B
    */
    
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
    isFilterAlphabeticalByAuthor = overText(filterAlphabeticalByAuthorX , filterAlphabeticalByAuthorY - 8, filterAlphabeticalByAuthorWidth , filterAlphabeticalByAuthorY + 8);
    isFilterAlphabeticalByBook = overText(filterAlphabeticalByBookX , filterAlphabeticalByBookY - 8, filterAlphabeticalByBookWidth , filterAlphabeticalByBookY + 8);
    isFilterByColor = overText(filterByColorX , filterByColorY - 8, filterByColorWidth , filterByColorY + 8);
    isFilterByLanguage = overText(filterByLanguageX , filterByLanguageY - 8, filterByLanguageWidth , filterByLanguageY + 8);
    isFilterByLocationInLibrary = overText(filterByLocationInLibraryX , filterByLocationInLibraryY - 8, filterByLocationInLibraryWidth , filterByLocationInLibraryY + 8);
    isFilterByYearOfPublication = overText(filterByYearOfPublicationX , filterByYearOfPublicationY - 8, filterByYearOfPublicationWidth , filterByYearOfPublicationY + 8);
  }
}
