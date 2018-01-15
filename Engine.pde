/*********************************************************************
Base engine class. Runs much of what actually makes the game work,
including rendering code. Uses its own instance of PGraphics in its own thread to do so.
Rendering frames are called one by one via a function call to make it
a little more efficient and simple to work with.
*********************************************************************/


import java.util.concurrent.LinkedBlockingQueue;


class Engine {
  
  ///////////////////////////////////////////////////////////////////
  //DATA
  ///////////////////////////////////////////////////////////////////
  private PGraphics masterFrame;
  ArrayList <Layer> = new Arraylist <Layer>;

  public void requestNextFrame() {
    return masterFrame.get();
  }
}

/*********************************************************************
Layer class, which includes independent drawing frames for graphics
and the actual location for positions. Nothing that is a position but
not a layer should EVER be stored outside a layer, and layers shouldn't
EVER be inside another layer as it can make the code very slow and
cause bizarre location requests.
*********************************************************************/
class Layer extends Position {
  private PGraphics frame;
  
}