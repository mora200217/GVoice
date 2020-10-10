
String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController gc; 
// -----------------------------------------
void setup() {

  size(700, 500);
  surface.setTitle(APP_NAME);
  
  background(255);

}

// -----------------------------------------
void draw() {
  switch(keyVal){
    //----------------------------
    case 1: 
        Ivan();
    break; 
    //----------------------------
        Juanfer(); 
    case 2: 
    
    break; 
    //----------------------------
    case 3: 
        Miguel(); 
    break; 
    //----------------------------
    case 4: 
        Morales(); 
    break; 
    
  }
  
  
}
