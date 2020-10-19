class GraphController {
  private PVector origin;
  private PVector dimension;
  private int id; 
  private int amountOfElements; 
  private boolean visibility; // Is Visible ?   
  private boolean rendering;  // Will render ? 
  private int MAX_GRAPHS_PER_CYCLE = 1;   

  public PGraphics imgToShow = createGraphics(width, height); 
  private boolean hasToGenerate = true; 
  // private PImage bg; 

  private Stack<PVector> dragPositions; 
  private QueueGen<Element>inScreen=new RefQueue();
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
    inScreen.enqueue(cosa);
  }

  private void savePoints(Element e) {
    float points[] = e.getPoints(this);
    PGraphics pg = createGraphics(width, height); // CAMBIAR

    pg.beginDraw(); 
    push();
    translate(this.axis.getOrigin().x-this.getDimension().x/2, this.axis.getOrigin().y);
    rotate(radians(180));
    scale(-1, 1);
    beginShape();
    noFill(); 
    for (int i = 0; i < points.length; i ++) { 
      //  valuesToGraph.pushRear(points[i]); // Análisis numérico posterior
      stroke(23);

      curveVertex(i* e.getDelta(), points[i]);
    }

    endShape();
    pop();
    pg.endDraw(); 

    // Agregar la imágen al final del dynamic Array
    graphsArray.push(pg);
  }


  public PGraphics generateImage() {
    PGraphics pg = createGraphics(width, height);

    pg.beginDraw(); 
    while (!graphsArray.empty())
      image(graphsArray.pop(), 0, 0);
    pg.endDraw();  
    return pg;
  }


  public void draw() {
    //(255); 
    rectMode(CENTER); 
    // base 
    noStroke();  
    // rect(this.origin.x, this.origin.y, this.dimension.x, this.dimension.y);
    // imageMode(CENTER); 
    // image(bg, this.origin.x, this.origin.y, this.dimension.x, this.dimension.y);
    this.update();


    // ---------- Renderizado de gráficas 
    Element memoria;
    float[] puntos;

    // stroke(random(0,255), random(0,255), random(0,255));

    // Desencolamos de la cola de renderizado por un máximo
    // de gráficas por ciclo. El ciclo 

    if (this.hasToGenerate||this.mouseDragged()) {
      background(255);
      this.axis.draw(); // Ejes dibujados 
      for (int j = 0; j < 1; j++) {
        memoria= inScreen.dequeue();
        this.savePoints(memoria); // Guarda los puntos como imagen
        inScreen.enqueue(memoria);
      }

      
      imgToShow = this.generateImage();
      hasToGenerate = false;
    }

    // image(this.imgToShow, 0, 0);
  }

  public Element headReference() {
    return inScreen.peek();
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
