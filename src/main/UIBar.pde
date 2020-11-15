class UIBar {
  private class Action {
    private PVector dim; 
    private String name;
    private PImage icon, iconEffect; 
    private PVector pos; 
    Action(String name, String file) {
      this.pos = new PVector(0, 0);
      this.dim = new PVector(20, 20); 
      this.name = name;

      this.icon = loadImage(file + ".png");
      this.iconEffect = loadImage(file + ".png"); 
      //iconEffect.filter(GRAY) ;
    }


    void show() {
      
      imageMode(CENTER);
      
      PImage iconToshow; 
      
      PVector mouse = new PVector(mouseX, mouseY);
      
      if(mouse.dist(this.pos) <= this.dim.x){
        rectMode(CENTER);
        fill(255, 90); 
        rect(0, this.pos.y, 9, this.dim.y * 1.7); 
        rectMode(LEFT);
        iconToshow = this.icon; 
        cursor(HAND); 
      }else{
         iconToshow = this.iconEffect;
         cursor(ARROW); 
      }
      image(iconToshow, this.pos.x, this.pos.y, this.dim.x, this.dim.y);
    }

    void setPos(float x, float y) {
      //if (!(this.pos.x == x && this.pos.y == y)){
      this.pos.mult(0).add(x, y);  
      //}
    }
  }
  private color c;
  private PVector pos; // Abscisa y ordenada 
  private PVector dim; // Ancho y alto 
  private boolean visible; 
  private ArrayList<Action> actions; 

  UIBar(float w, float h) {

    this.visible = true; 
    this.c = color(255, 24, 25); 
    this.pos = new PVector(0, 0);
    this.dim = new PVector(50, h);
    actions = new ArrayList<Action>();

    actions.add(new Action("prueba", "logo"));
    actions.add(new Action("prueba", "undo"));
    actions.add(new Action("as", "disk"));
    actions.add(new Action("as", "bin"));
  }

  void show() {
    noStroke();
    fill(#3D4C62); 
    rect(this.pos.x, this.pos.y, this.dim.x, this.dim.y);

    float offset = 40;
    float xPos = this.pos.x + 0.5 * ( this.dim.x );
    float yPos = 20; 
    for (int i = 0; i < actions.size(); i++) {

      Action a = actions.get(i);
      println((i +1) + " Action: " + a.name + " " + yPos);
      a.setPos(xPos, yPos); 
      a.show();
      yPos += offset;
    }
  }
}
