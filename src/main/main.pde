
String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
// -----------------------------------------
void setup() {
  //int count = millis();
  int val = 10;
  size(700, 500);
  surface.setTitle(APP_NAME);
  grafica = new  GraphController(width, height);
  grafica.setOrigin(width/2, height/2);
  float [] hola={1,1,1};
  Polinomio[] f2 = new Polinomio[val];
  Polinomio f3=new Polinomio(3);
  
  for(int i = 0; i < val; i++){
    f2[i] = new Polinomio(i+1);
    grafica.addElement(f2[i]);
  }
  grafica.addElement(f3);
  background(255);
  //print((millis()-count));
  
  grafica.setDimension(width,height);
}

// -----------------------------------------
void draw() {
  background(255);
  int count = millis();
  grafica.draw();
  println((millis()-count));
  
  //switch(keyVal){
  //  //----------------------------
  //  case 1: 
  //      Ivan();
  //  break; 
  //  //----------------------------
  //      Juanfer(); 
  //  case 2: 
    
  //  break; 
  //  //----------------------------
  //  case 3: 
  //      Miguel(); 
  //  break; 
  //  //----------------------------
  //  case 4: 
  //      Morales(); 
  //  break; 
    
  //}
  
  
}
