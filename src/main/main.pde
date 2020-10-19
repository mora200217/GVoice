String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
PGraphics ui; 
boolean render = true; 
int count2 = 0; 
int val = 0;

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

//-----------------------------------------
void render() {
  grafica.draw(); 
  
}

// -----------------------------------------

void UI() {
  Button b = new Button(80, 40, 40);
  b.update();
  b.draw(); 

  Polinomio f3=new Polinomio(frameCount % 3 + 1);
  if (b.isMousePressed()) {
    grafica.addElement(f3);
    grafica.generateImage();
  }
}


// -----------------------------------------
void draw() {
  // background(255, 255, 255, 23);
  
  test.beginSample();
  render(); 
  UI();
  test.endSample();
  
  // image(grafica.imgToShow, 230, 23);
}

void mousePressed() {
  // render = true; 
  count2 = 0;
}
