
class AxisSystem {
  private float[] xInterval = {-10, 10};
  private float[] yInterval = {-10, 10};

  private PVector origin;
  private PVector dimension;

  private Queue<PVector> moveQueue; 

  public AxisSystem(PVector origin, PVector dimension) {
    this.origin = origin; 
    this.dimension = dimension;
    // this.moveQueue = new Qu
  }

  public void setOrigin(float x, float y) {
    this.origin = new PVector(x, y);
  }

  public PVector getOrigin() {
    return this.origin;
  }

  public void setDimension(float x, float y) {
    this.dimension = new PVector(x, y);
  }


  public void draw() {
    stroke(200); 
    // vertical
    line(this.origin.x, 0, this.origin.x, height);
    // horizontal
    line(0, this.origin.y, width, this.origin.y );

    // Texto 
    fill(23); 
    text("x", 20, 20);
    text("x", this.origin.x + this.dimension.x / 2 - 15, this.origin.y + 15);

    //     if()
  }
}
