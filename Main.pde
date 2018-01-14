/*********************************************************************
MAIN FILE.
this file includes all code that handles initialization of the game
engine, it's needed variables (and constants), and its display subsystem.
Takes advantage of multithreading to allow the draw thread
to operate at maximum speed, as the engine issues all needed draw
commands separately through the queue.
*********************************************************************/


/*********************************************************************
initializing variables.
*********************************************************************/

//Two PImages. Current and next frame to be drawn.
PImage frame1;
PImage frame2;
//Determines which frame is drawing.
boolean isFrame1Drawing = true;
boolean isGameReadyForRendering = false;

/*********************************************************************
After this, it's all render code. Fairly simple stuff, actually.
*********************************************************************/

void setup() {
   size(800,800, P2D);   //Game Window
   frameRate(60);        //refresh rate of screen
   
   isGameReadyForRendering = true; //all initialization completed, time to render!
}

void draw() {
  background(0); //clear for new draw iteration
  if(isFrame1Drawing) {
    image(frame1);
  }
  else {
    image(frame2);
  }
}