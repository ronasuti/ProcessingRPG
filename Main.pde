//Main file that takes draw calls from Engine and renders them.
//EVERYTHING ELSE RUNS IN OTHER THREADS FOR PERFORMANCE.

import java.util.concurrent.ConcurrentLinkedQueue;

//layered PGraphics make up the render frame
//

void setup() {
   size(960,960, P2D);
   frameRate(30);
}

void draw() {
  background(0); //clear for new draw iteration
  
}