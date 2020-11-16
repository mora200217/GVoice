String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
PGraphics ui; 
boolean render = true; 
int count2 = 0; 
int val = 1;
boolean toChange = true; 
PGraphics image; 
GeneratorTest test; 

UI gui; 

// -----------------------------------------
void setup() {
  
  test = new GeneratorTest(); 
  //int count = millis();
  val = 0;
  size(700, 500);
  ui = createGraphics(40, 40);
  surface.setTitle(APP_NAME);
  surface.setResizable(true); 
  grafica = new  GraphController(width, height);
  
  grafica.setOrigin(width/2, height/2);
  gui = new UI(width, height, grafica); 
  float [] hola={1, 1, 1};
  Polinomio[] f2 = new Polinomio[val];
  Polinomio f3=new Polinomio(3);

  for (int i = 0; i < val; i++) {
    f2[i] = new Polinomio(i+1);
    grafica.addPolinomio(f2[i]);
  }
  grafica.addPolinomio(f3);
  background(255);
  //print((millis()-count));

  grafica.setDimension(width, height);
}
// -----------------------------------------

void UI() {

  float B_RAD = 40; 
  float OFFSET = 15; 
  Button b = new Button(width - B_RAD - OFFSET, height - B_RAD - OFFSET, B_RAD);
  b.update();
  b.draw(); 

  float[] t = { random(0,1) / 100,  random(0,1) / 100,  random(0,1) / 100}; 

  Polinomio f3 = new Polinomio(t, 2);

  // Agregar gráfica
  if ( b.isMousePressed() && toChange) {

    grafica.addPolinomio(f3);
    toChange = false;
  }
}


// -----------------------------------------
void draw() {

  background(255);
  grafica.draw();
  gui.show(); 

  UI();
}


void keyPressed() {
  if (key == CODED)
    if (keyCode == UP)
      grafica.setZoom(1.1*grafica.getZoom()); 
    else if (keyCode == UP)
      grafica.setZoom(0.9*grafica.getZoom());

  grafica.generateImage();
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e>0)
    grafica.setZoom(1.1*grafica.getZoom());
  else
    grafica.setZoom(grafica.getZoom()/1.1);
  grafica.generateImage();
}
void mouseReleased() { 
  toChange = true; 
  grafica.generateImage();
}

void mouseDragged(){
   // grafica.generateImage(); 
}
