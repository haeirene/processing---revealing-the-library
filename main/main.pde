import org.openkinect.processing.*;
import spout.*;

/*
 * DISPLAY DESIGN
*/

Display design;
color cWhite = color(255, 255, 255);
color cBlack = color(54, 54, 54);
Book book;

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
int xSecondScreen = 1280;
//int xSecondScreen = 0;

int screenWidth = 1280;
int screenHeight = 800;

/*
 Notities
 - eerste kolom: vanaf 13pt leesbaarder
 - zoekbalk te laag
 - filter opties zijn aanklikbaar
 - dunste boek kan ik met 1 vinger aanraken
 - afbeeldingen boeken: knopen op goeie hoogte
 - kinect of handschoen iets met L
 - ik kan bij de afbeeldingen van 1 boek de derde afbeelding aanraken (tot zover kan de design verplaatst worden)
 - deze sketch werkt in processing 3, niet 4
*/

void setup(){
  //1280 * 2 = 2560
  size(2560, 800, P3D);
  
  /*
   * DISPLAY DESIGN
  */
  
  design = new Display();
  book = new Book();
  
  /*
   * HARDWARE
  */
  finalImg = createGraphics(1280, 800, JAVA2D);
  
  kinect = new Kinect (this);
  kinect.initDepth();
  
  spout = new Spout(this);
  spout.createSender("main");
}

void draw(){
  /*
   * DISPLAY DESIGN
  */
  
  background(cWhite);

  design.show();
  book.showBookDetails();
  
  /*
   * KINECT
  */
  
  // Get the raw depth as array of integers
  int[] depth = kinect.getRawDepth();
  
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
  
  fill(255, 0, 150);
  ellipse(rx, ry, 32, 32);
  
  
  //At the end
  spout.sendTexture();
}
