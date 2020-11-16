class GraphController {
  private PVector origin;
  private PVector dimension;
  private int id; 
  private int amountOfPolinomios; 
  private boolean visibility; // Is Visible ?   
  private boolean rendering;  // Will render ? 
  private int MAX_GRAPHS_PER_CYCLE = 1;   
  private RefStack<Polinomio> inScreenStack; 
  private float zoomVal=1
  ;
  public PGraphics imgToShow; 
  private boolean hasToGenerate = true; 
  // private PImage bg; 

  private Stack<PVector> dragPositions; 
  public QueueGen<Polinomio>inScreen=new RefQueue();
  private LinkedList<Float> valuesToGraph = new LinkedList(); 


  private Stack<PGraphics> graphsArray = new Stack(1000);

  private AxisSystem axis; 
  private int step = 0; 
  private PGraphics pg; 

  //public RefStack<> actionHistory 

  public GraphController() {
    this(100, 100);
  }

  public GraphController(float x, float y) {
    inScreenStack = new RefStack(); 
    imgToShow = createGraphics(width, height); 
    origin = new PVector(x, y); 
    dimension = new PVector(500, 500); 
    axis = new AxisSystem(origin, dimension); 
    dragPositions = new Stack<PVector>(200); 
    // bg = loadImage("bg.png");
    pg = createGraphics(width, height);
  }

  public PVector getOrigin() {
    return this.origin;
  }
  public void setZoom(float zoom) {
    zoomVal=zoom;
  }
  public float getZoom() {
    return zoomVal;
  }

  public int numGraphs() {
    return inScreen.numInside();
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
  public void addPolinomio(Polinomio cosa) {
    inScreen.enqueue(cosa);
    inScreenStack.push(cosa); 
  }

  private void savePoints(Polinomio e) {
    float points[] = e.getPoints(this);
    PGraphics pg = createGraphics(width, height); // CAMBIAR

    pg.beginDraw(); 

    pg.push();
    pg.translate(this.getOrigin().x -this.getDimension().x/2 , this.getOrigin().y);
    pg.rotate(radians(180));
    pg.scale(-1, 1);
    pg.noFill(); 
    pg.stroke(23);
    pg.beginShape();
    for (int i = 0; i < points.length; i ++)
      pg.curveVertex(i*e.getDelta(), points[i]);
    pg.endShape();
    pg.pop();

    pg.endDraw(); 
    graphsArray.push(pg);
  }

  public PGraphics generateImage() {
    Polinomio memoria;

    for (int j = 0; j < inScreen.numInside(); j++) {
      memoria= inScreen.dequeue();
      this.savePoints(memoria); // Guarda los puntos como imagen
      if(!memoria.isNull())
        inScreen.enqueue(memoria);
    }

    PGraphics pgf = createGraphics(width, height);

    pgf.beginDraw(); 

    while (!graphsArray.empty())
      pgf.image(graphsArray.pop(), 0, 0);
    pgf.endDraw();

    this.imgToShow = pgf;

    return pgf;
  }

  public void draw() {
    this.axis.draw();
    this.update();
    if (mousePressed) {
    }
    imageMode(CENTER); 
    image(this.imgToShow, this.origin.x, this.origin.y);
  }

  public Polinomio headReference() {
    return inScreen.peek();
  }

  public boolean isMouseOver() {
    return true;
  }


  public boolean mouseDragged() {
    return this.isMouseOver() && mousePressed;
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
      this.hasToGenerate = true;
    } else if (!dragPositions.empty() && dragPositions.numInside < 2) {
      dragPositions.pop();
    }

    if (!dragPositions.empty() && dragPositions.numInside > 2) {
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
