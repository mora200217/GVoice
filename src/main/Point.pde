class Point {
  PVector pos; 
  private float RAD = 20;  
  Point(float posx, float posy) {
    this.pos = new PVector(posx, posy);
  }

  void show() {
    fill(255, 255, 0); 
    noStroke(); 
    ellipse(pos.x, pos.y, 20, 20);
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY); 
    if (mouse.dist(this.pos) < RAD) {
      fill(0);  
      rect(this.pos.x, this.pos.y, 100, 20);
      fill(255);
        text("Posiciones", this.pos.x, this.pos.y);
    }
  }
}
