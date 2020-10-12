class GraphController {
  private PVector origin;
  private PVector dimension;
  private int id; 
  private int amountOfElements; 
  private boolean visibility; // Is Visible ?   
  private boolean rendering;  // Will render ? 
  // private PImage bg; 
  private Stack<PVector> dragPositions; 
  private QueueGen<Element>inScreen=new RefQueue();
  private AxisSystem axis; 

  public GraphController() {
    this(100, 100);
  }

  public GraphController(float x, float y) {
    origin = new PVector(x, y); 
    dimension = new PVector(500, 500); 
    axis = new AxisSystem(origin, dimension); 
    dragPositions = new Stack<PVector>(200); 
    // bg = loadImage("bg.png");
  }

  public PVector getOrigin() {
    return this.origin;
  }

  public void setOrigin(float x, float y) {
    this.origin = new PVector(x, y);
    this.axis.setOrigin(x, y);
  }

  public boolean isVisible() {
    return this.visibility;
  }
  public void toggleVisibility() {
    this.visibility = !this.isVisible();
  }

  public PVector getDimension() {
    return this.dimension;
  }

  public void setDimension(float x, float y) {
    this.dimension = new PVector(x, y);
    this.axis.setDimension(x, y);
  }
  public void addElement(Element cosa) {
    inScreen.enQueue(cosa);
  }



  public void draw() {
    rectMode(CENTER); 
    // base 
    fill(255); 
    noStroke();  
    rect(this.origin.x, this.origin.y, this.dimension.x, this.dimension.y);
    // imageMode(CENTER); 

    // image(bg, this.origin.x, this.origin.y, this.dimension.x, this.dimension.y); 


    this.update();
    this.axis.draw();
    Element memoria;
    float[] puntos;
    for(int j=0;j<inScreen.numInside();j++) {
      memoria=inScreen.deQueue();
      puntos=memoria.getPoints(this);
      push();
      stroke(random(0,255),random(0,255),random(0,255));
      translate(this.axis.getOrigin().x-250,this.axis.getOrigin().y);
        rotate(radians(180));
        scale(-1,1);
      for (int i=0; i<puntos.length-1; i++) {
        line(i*memoria.getDelta(), puntos[i],(i+1)*memoria.getDelta(),puntos[i+1]);
      }
      pop();
      inScreen.enQueue(memoria);
    }
    // axes
  }


  public boolean isMouseOver() {
    return true; 
    /*   if (2 * abs(mouseX - this.origin.x) < this.dimension.x && 
     2 * abs(mouseY - this.origin.y) < this.dimension.y) {
     return true;
     }
     return false;*/
  }


  public boolean mouseDragged() {
    if (this.isMouseOver() && mousePressed) {
      return true;
    }

    return false;
  }

  public void update() {
    // Mouse encima 
    if (this.isMouseOver())
      cursor(MOVE); 
    else
      cursor(ARROW);


    // Mouse drag
    if ( this.mouseDragged() ) {
      dragPositions.push(new PVector(mouseX, mouseY));
    } else if (!dragPositions.empty() && dragPositions.limsup < 2) {
      dragPositions.pop();
    }

    if (!dragPositions.empty() && dragPositions.limsup > 2) {
      PVector posToLoad = dragPositions.pop(); 
      PVector posToLoad_2 = dragPositions.pop();

      PVector finalPos = posToLoad.sub(posToLoad_2); 


      PVector actual = this.axis.getOrigin();
      finalPos.normalize().mult(10).add(actual);

      System.out.printf("x: %.2f, y: %.2f\n", finalPos.x, finalPos.y);
      this.axis.setOrigin(finalPos.x, finalPos.y);
    }
  }
}
