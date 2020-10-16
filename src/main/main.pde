
String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController perrohp; 
float [] hola={0,-10,1};
  Polinomio f1=new Polinomio(hola,2);
  Polinomio f2=new Polinomio(1);
  Polinomio f3=new Polinomio(3);
  
// -----------------------------------------
void setup() {

  size(700, 500);
  surface.setTitle(APP_NAME);
  DynamicArray<Integer> hola= new DynamicArray();
  hola.set(16,5);
  println(hola.length());
  perrohp =new  GraphController(width, height);
  perrohp.setOrigin(width/2, height/2);
  
  perrohp.addElement(f1);
  perrohp.addElement(f2);
   perrohp.addElement(f3);
  background(255);

}

// -----------------------------------------
void draw() {
  background(255);
  
  perrohp.draw();
  
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
void mousePressed(){
  f1.coef[0]+=1;
}
