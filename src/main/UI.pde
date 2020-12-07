
class UI {
  UIBar bar; 
  GraphController g; 
  PVector maxDim;  
  UI(float w, float h, GraphController g) {
    this.g = g; 
    this.maxDim = new PVector(w, h); 
    bar = new UIBar(this.maxDim.x, this.maxDim.y, g);
  }

  void toggleButtons() {
  }

  void toggleText() {
  }

  void show() {
    bar.show();
  float h = 20;
  float w = 200;

    // rectMode(LEFT);
    push();
        if (this.g.peticionrec)
      fill(255, 0, 0);
    else
      fill(10, 10, 10); 
    translate(10, 10); 
    rectMode(CENTER); 
    rect(width- w / 2, 0 , w, h);
    pop();
  }
}
