
class AxisSystem {
  private float[] xInterval = {-10, 10};
  private float[] yInterval = {-10, 10};
  public float zoom;  
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
    // (255);
    stroke(200); 
    // vertical
    line(this.origin.x, 0, this.origin.x, height);
    // horizontal
    line(0, this.origin.y, width, this.origin.y );

    int numPart = 10; 
    int offset = 5;

    float i = this.origin.x;
    while (i < width) {
      // line(i, this.origin.y - offset, i, this.origin.y + offset);
      fill(0, 80); 
      text((1/this.zoom * (i - this.dimension.x / 2 - (this.origin.x - width/2))), i, this.origin.y + 3 * offset);
      i += 100;
    }

    i = this.origin.x;
    while (i > 0) {
      // line(i, this.origin.y - offset, i, this.origin.y + offset);
      fill(0, 80); 
      text( (1/this.zoom * (i - this.dimension.x / 2 - (this.origin.x - width/2))), i, this.origin.y + 3 * offset);
      i -= 100;
    }




    // Texto 
    fill(23); 
    text("y", this.origin.x - 15, 20);
    text("x", width - 20, this.origin.y + 15);
  }
}
