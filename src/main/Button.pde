class Button {
  private PVector pos; 
  private float RAD; 
  private float offset; 
  private boolean isScaled; 

  Button(float posX, float posY, float RAD) {
    this.pos = new PVector(posX, posY); 
    this.RAD = RAD;
    this.isScaled = false; 
    this.offset = 2;
  }

  Button(float posX, float posY) {
    this(posX, posY, 20);
  }

  private void transition() {
    println("Transition");
  }


  public void update() {
    if (this.isMouseOver() && !isScaled) {
      isScaled = true; 
      this.scale(10);
    } else {
      this.scale(0.1);
      isScaled = false;
    }
    
    if (this.isMousePressed())
      print("Pressed"); 
    
  }


  public void draw() {
    if (this.isMouseOver())
      cursor(HAND);

    noStroke(); 
    fill(23, 23, 123); 
    ellipse(this.pos.x, this.pos.y, this.RAD + this.offset, this.RAD + this.offset);
  }

  public boolean isMousePressed() {
    return this.isMouseOver() && mousePressed;
  }

  public void scale() {
    this.scale(2); // Por defecto
  }

  public void scale(float s) {
   
    this.offset *= s;
  }

  public boolean isMouseOver() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(this.pos); 
    return mouse.mag() < this.RAD;
  }
}
