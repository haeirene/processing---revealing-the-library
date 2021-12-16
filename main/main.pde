import org.openkinect.processing.*;
import spout.*;

/*
 * DESIGN
*/

color cWhite = color(255, 255, 255);
color cBlack = color(54, 54, 54);

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

PFont brandonGrotesqueBold40;
PFont brandonGrotesqueBold18;
PFont brandonGrotesqueRegular10;
PFont brandonGrotesqueRegular12;
PFont brandonGrotesqueRegular16;
PFont brandonGrotesqueRegular18;

PImage img;
PGraphics finalImg;

// Spout
Spout spout;

// Screen size
int xFirstScreen = 0;
int xSecondScreen = 1280;

int screenWidth = 1280;
int screenHeight = 800;

void setup(){
  //1280 * 2 = 2560
  size(1280, 800, P3D);
  
  brandonGrotesqueBold40 = createFont("Brandon_bld.otf", 30);
  brandonGrotesqueBold18 = createFont("Brandon_bld.otf", 18);
  brandonGrotesqueRegular10 = createFont("Brandon_reg.otf", 10);
  brandonGrotesqueRegular12 = createFont("Brandon_reg.otf", 12);
  brandonGrotesqueRegular16 = createFont("Brandon_reg.otf", 16);
  brandonGrotesqueRegular18 = createFont("Brandon_reg.otf", 18);
  
  // Hardware
  //kinect = new Kinect (this);
  //kinect.initDepth();
  
  spout = new Spout(this);
  spout.createSender("main");
}

void draw(){
  /*
   * DESIGN
  */
  
  background(cWhite);
  
  // FIRST COLUMN
  
  fill(cBlack);
  textFont(brandonGrotesqueBold40);
  text("VISUALIZING THE LIBRARY", 81, 224);
  
  textFont(brandonGrotesqueRegular12);
  text("A selection of 24 books was picked out of the collections ‘old Library’ and ‘special editions’. Both these collections contain vulnerable and valuable books: because of their uniqueness, age, physical fragility or even economical value.", 81, 360, 321, 360);
  
  
  // SECOND COLUMN
  
  textFont(brandonGrotesqueBold18);
  //text(string, x1, y1, x2, y2)
  text("FILTER", 481, 224);
  
  textFont(brandonGrotesqueRegular10);
  text("Filter to see a specific part of the library or use the searchbar to look for a specific book.", 481, 288, 800, 321);
  
  // SECOND COLUMN - PART A
  
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
  
  // SECOND COLUMN - PART B
  
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
  
  finalImg.updatePixels();*/
  
  /*
    * DISPLAY
  */
  
  //At the end
  spout.sendTexture();
}
