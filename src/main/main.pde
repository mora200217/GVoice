
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
  size(900, 500);
  ui = createGraphics(40, 40);
  surface.setTitle(APP_NAME);
  surface.setResizable(true); 
  grafica = new  GraphController(width, height);

  grafica.setOrigin(width/2, height/2);
  gui = new UI(width, height, grafica); 
  //print((millis()-count));
  //Heap h = new Heap(f3,grafica);
  //PVector p1 = new PVector(50.51,5.2);
  //h.insertItem(p1);
  //PVector p2 = new PVector(34.5,2);
  //h.insertItem(p2);
  //PVector p3 = new PVector(15,1);
  //h.insertItem(p3);
  //PVector p4 = new PVector(50.51,10);
  //h.insertItem(p4);
  //PVector p5 = new PVector(5,5,3);
  //h.insertItem(p5);
  //PVector p6 = new PVector(10,0);
  //h.insertItem(p6);
  //PVector p7 = new PVector(16,8);
  //h.insertItem(p7);
  //PVector p8 = new PVector(1,7);
  //h.insertItem(p8);
  //PVector p9 = new PVector(-1,50);
  //h.insertItem(p9);
  //PVector p10 = new PVector(2,4);
  //h.insertItem(p10);
  //PVector aux;
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
  //aux = h.removeMin();
  //print("Prueba (%.2f,%.2f)\n", aux.x,aux.y);
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


  // Agregar gráfica
  if ( b.isMousePressed() && toChange) {
    // grafica.addPolinomio(f4);
    // grafica.addPolinomio(f3);

    GeneratorTest gt = new GeneratorTest();
    gt.beginSample();
    
    for (int test = 0; test < 20; test++) {
      Test2 t3 = new Test2(test + 5);


      grafica.inScreen = t3.createSamples();


      grafica.generateImage();
      gt.step(); 
    }
    gt.endSample();
    gt.createReport("txt"); 
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
    else if (keyCode == DOWN)
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

void mouseDragged() {
  // grafica.generateImage();
}
