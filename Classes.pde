/*********************************************************************
Simple 2D point object that cannot do anything on it's own.
Can be extended for raw positioning objects for producing complex
derivative motion. MUST be extended for this use case.
*********************************************************************/

abstract class Position {

  ///////////////////////////////////////////////////////////////////
  //DATA
  ///////////////////////////////////////////////////////////////////
  
  //dimensions: x coord, y coord. Relative to parent.
  
  private float x = 0;
  private float y = 0;
  
  //scale. Not directly used by the owning position,
  //but used by MANY other things so children positions
  //update intelligently to parents that are scaled.
  
  private float xScale = 0;
  private float yScale = 0;
  
  //rotation, in radians
  
  private float rotation = 0;
  
  //child positions, if any
  
  private ArrayList <Position> children;
  
  //parent object
  
  private Position parent;
  
  //can this object tick?
  
  private boolean canTick;
  
  
  ///////////////////////////////////////////////////////////////////
  //METHODS
  ///////////////////////////////////////////////////////////////////
  //initialization
  public Position(float x, 
                  float y, 
                  float xScale, 
                  float yScale, 
                  float rotation,
                  Position parent,
                  boolean canTick) {
    //manual initialization for full control
    this.x = x;
    this.y = y;
    this.xScale = xScale;
    this.yScale = yScale;
    this.rotation = rotation;
    this.parent = parent;
    this.canTick = canTick;
  }
  
  //updates a set amount of times per second, set by engine
  //this should NOT include sensitive game code, as the game may tick
  //slower under heavy load.
  public void tick() {
    
  }
  
  ///////////////////////////////////////////////////////////////////
  //ACCESSORS
  ///////////////////////////////////////////////////////////////////
  
  //these all run sorta like recursive calls, going up the parent tree
  //to handle the complexities of relative location. Feeling proud of
  //this simple but elegant implementation ^___^ 
  //Check that there's a parent. If so, call THEIR function.
  //repeat until origin is found. Computations then step back down.
  public float getGlobalX() {
    if(parent != null) {
      parent.getGlobalX();
    } else {
    
    } 
  }
  
  public float getGlobalY() {
    if(parent != null) {
      parent.getGlobalY();
    }  else {
    
    }
  }
  
  public float getGlobalXScale() {
    if(parent != null) {
      parent.getGlobalXScale();
    }  else {
    
    }
  }
  
  public float getGlobalYScale() {
    if(parent != null) {
      parent.getGlobalYScale();
    }  else {
    
    }
  }
  public float getGlobalRotation() {
    if(parent != null) {
      parent.getGlobalRotation();
    }  else {
    
    }
  }
}

/*********************************************************************
Simple Image object to display stuff on-screen, lacks controller attachments.
Can be used on it's own, but can also be extended to produce some
basic non-controllable, non-interactable objects with, say, set lifespans,
computed movement, switching between multiple image files
programmatically, etc.
*********************************************************************/

class Image extends Position implements Drawable {
  
}

/*********************************************************************
Base actor class for player and advanced AI control. In general,
actual game agents should be Actors, anything that has exceedingly
simple logic (displays, maybe moves, but doesn't interact) should be
forked from a different class
*********************************************************************/

abstract class Actor extends Position implements Drawable {
  
  ///////////////////////////////////////////////////////////////////
  //DATA
  ///////////////////////////////////////////////////////////////////
  
  Controller controller;
  
  ///////////////////////////////////////////////////////////////////
  //METHODS
  ///////////////////////////////////////////////////////////////////
  
  public Actor(float x, 
                  float y, 
                  float xScale, 
                  float yScale, 
                  float rotation,
                  Position parent,
                  boolean canTick,
                  ) {
    //manual initialization for full control
    this.x = x;
    this.y = y;
    this.xScale = xScale;
    this.yScale = yScale;
    this.rotation = rotation;
    this.parent = parent;
    this.canTick = canTick;
  }
  
  ///////////////////////////////////////////////////////////////////
  //ACCESSORS
  ///////////////////////////////////////////////////////////////////
}

/*********************************************************************
Base abstract Controller class. Not to be confused with Controllable,
the interface for passing keyboard and mouse inputs. Controllers can
manipulate multiple Actors if needed. In general, don't use this base
class, extend AIController or PlayerController as they have some extra
tools.
*********************************************************************/

abstract class Controller {
  
}

/*********************************************************************
AI Controller class, designated for autonomous operation.
*********************************************************************/

abstract class AIController extends Controller {
  
}

/*********************************************************************
Player controller class. This 
*********************************************************************/

abstract class PlayerController extends Controller implements Controllable {
  
}