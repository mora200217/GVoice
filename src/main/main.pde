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
  float [] hola={1, 1, 1};
  Polinomio[] f2 = new Polinomio[val];
  Polinomio f3=new Polinomio(3);

  for (int i = 0; i < val; i++) {
    f2[i] = new Polinomio(i+1);
    grafica.addElement(f2[i]);
  }
  grafica.addElement(f3);
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

  Polinomio f3 = new Polinomio(frameCount % 8 + 1);

  // Agregar gráfica
  if ( b.isMousePressed() && toChange) {
    grafica.addElement(f3);
    toChange = false; 
  }

  // Texto
  fill(12); 
  text("GVoice v1.0", 20, 20 );
  fill(50); 
  text("n Graficas: " + grafica.numGraphs(), 20, 35 );
}


// -----------------------------------------
void draw() {
  background(255);
  grafica.draw();


  UI();
}


void mousePressed() {
   
}

void mouseReleased() {
  
  toChange = true; 
  grafica.generateImage();
}
