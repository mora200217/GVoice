class Boton {
  String value;
  int size;
  color color_Boton = color(7,100,162);
  color color_Text = color(255,255,255);
  float [] position = {0,0};
  public boolean pressed = false;

  Boton(String value, float x_pos, float y_pos){
    this.value = value;
    this.position[0] = x_pos;
    this.position[1] = y_pos;
    this.size = 30;
  }
  
  Boton(String value, float x_pos, float y_pos, int size){
    this.value = value;
    this.position[0] = x_pos;
    this.position[1] = y_pos;
    this.size = size;
  }
  void setPressed(boolean isPressed){
    pressed = isPressed;
  }
  String getValue(){
    return value;
  }
  
  void display(){
  push();
  fill(this.color_Boton);
  translate(0,0);
  noStroke();
  drawBoton();
  pop();
  }
  void drawBoton(){

     if(pressed){
       strokeWeight(2);
       stroke(color_Text-30);
     }
     else {
      noStroke();
    }
    circle(position[0],position[1],size);
    if(pressed){
      fill(0);
      textSize(15);
      text(value, position[0]-7.5, position[1]+4.5);
    }
    else{
      fill(color_Text);
      textSize(15);
    }
    text(value, position[0]-7, position[1]+5);
    pressed = false;
  }
}
