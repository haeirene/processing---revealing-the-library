import org.openkinect.processing.*;
import spout.*;

// Hardware - kinect
Kinect kinect;

int depthValueKinect = 2048;
int rx;
int ry;
int skip = 1;

float minThresh = 240;
float maxThresh = 469;

PImage img;
PGraphics finalImg;

// Hardware - spout
Spout spout;

// Screen size
int xFirstScreen = 0;
int xSecondScreen = 1280;

int screenWidth = 1280;
int screenHeight = 800;

void setup(){
  //1280 * 2 = 2560
  size(2560, 800, P2D);
  
  // Hardware
  kinect = new Kinect (this);
  kinect.initDepth();
  
  spout = new Spout(this);
  spout.createSender("main");
}

void draw(){
  
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
      //int ty = int(map(y, 0, finalImg.height, 0, kinect.height));
      //int tx = int(map(x, 0, finalImg.width, 0, kinect.width));
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
  
  /*
    * DISPLAY
  */
  
  //At the end
  spout.sendTexture();
}
