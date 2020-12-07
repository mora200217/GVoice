Boton[] botones = new Boton[16];
int separation = 45;
boolean click = false;
String text = "";
float num_a;
float num_b;
float num_c;
float positions[][][] = {{{1,1},{2,1},{3,1},{4,1}},
                         {{1,2},{2,2},{3,2},{4,2}},
                         {{1,3},{2,3},{3,3},{4,3}},
                         {{1,4},{2,4},{3,4},{4,4}},
                         {{1,5},{2,5},{3,5},{4,5}}};
Screen screen = new Screen(160,20,53,10);
void setup() {
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 4; j++){
      for(int k = 0; k < 2; k++){
        positions[i][j][k] = positions[i][j][k]*separation+20; 
      }
    }
  }
  size(600,600);
  // a ( ) ->
  botones[0] = new Boton(" 7",positions[0][0][0],positions[0][0][1]);
  botones[1] = new Boton(" 8",positions[0][1][0],positions[0][1][1]);
  botones[2] = new Boton(" 9",positions[0][2][0],positions[0][2][1]);
  botones[3] = new Boton(" /",positions[0][3][0],positions[0][3][1]);
  
  botones[4] = new Boton(" 4",positions[1][0][0],positions[1][0][1]);
  botones[5] = new Boton(" 5",positions[1][1][0],positions[1][1][1]);
  botones[6] = new Boton(" 6",positions[1][2][0],positions[1][2][1]);
  botones[7] = new Boton(" x",positions[1][3][0],positions[1][3][1]);
  
  botones[8] = new Boton(" 1",positions[2][0][0],positions[2][0][1]);
  botones[9] = new Boton(" 2",positions[2][1][0],positions[2][1][1]);
  botones[10] = new Boton(" 3",positions[2][2][0],positions[2][2][1]);
  botones[11] = new Boton(" -",positions[2][3][0],positions[2][3][1]);
  
  botones[12] = new Boton(" 0",positions[3][0][0],positions[3][0][1]);
  botones[13] = new Boton(" .",positions[3][1][0],positions[3][1][1]);
  botones[14] = new Boton("=",positions[3][2][0],positions[3][2][1]);
  botones[15] = new Boton(" +",positions[3][3][0],positions[3][3][1]);
  
  // 0 . = +
  //botones[16] = new Boton(" 0",positions[4][0][0],positions[4][0][1]);
  //botones[17] = new Boton(" .",positions[4][1][0],positions[4][1][1]);
  //botones[18] = new Boton("=",positions[4][2][0],positions[4][2][1]);
  //botones[19] = new Boton(" +",positions[4][3][0],positions[4][3][1]);
  
}

void draw() {
  background(50);
  for(int i = 0; i< 16; i++){
    botones[i].display();
  }
  screen.display(text);
}

void mouseClicked(){ 
      for(int j = 0; j<16; j++){
        if ((dist(mouseX, mouseY,botones[j].position[0],botones[j].position[1])<20)){
          botones[j].setPressed(true);
          String a = botones[j].getValue();
          text_id(a);
        }
      }
}
String text_id(String b){
  if(b== "="){
    quehacer(text);
    b = "";
    text = "";
  }
  text = text + b;
  return text;
}
String quehacer(String antes){
  char part;
  boolean esdecimal = false;
  for(int i = 0; i < antes.length(); i++){
    part = antes.charAt(i);
    if(part == ' '){
    }
    if(part == '+'){
      println(antes.charAt(i-2));
      println(antes.charAt(i+2));
      num_c = parseFloat(antes.charAt(i-2))-48 + parseFloat(antes.charAt(i+2))-48;
      println(num_c); 
    }
  }
   return "hola"; 
}
