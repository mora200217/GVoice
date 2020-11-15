class Screen {
  String text;
  int [] size = {120,50};
  color color_Screen = color(255);
  color color_Text = color(0);
  float [] position = {1, 1};
  boolean pressed = true;

  Screen(int size_x, int size_y, float position_x, float position_y) {
    this.size[0] = size_x;
    this.size[1] = size_y;
    this.position[0] = position_x;
    this.position[1] = position_y;
  }
  void display(String input) {
    push();
    fill(this.color_Screen);
    translate(position[0], position[1]);
    noStroke();
    drawScreen(input);
    pop();
  }
  void drawScreen(String a) {
    strokeWeight(2);
    stroke(color_Text-30);
    rect(0,0,size[0],size[1]);
    fill(0);
    textSize(15);
    for(int i = 0; i < a.length(); i++){
      if(i < 32){
        text(a.charAt(i),5*i,19);
      }
    }
    pressed = false;
  }
}
