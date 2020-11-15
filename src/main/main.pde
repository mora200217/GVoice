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
  val = 3;
  size(700, 500);
  ui = createGraphics(40, 40);
  surface.setTitle(APP_NAME);
  surface.setResizable(true); 
  grafica = new  GraphController(width, height);
  grafica.setOrigin(width/2, height/2);
  float [] hola={0, 0, 1};
  Polinomio[] f2 = new Polinomio[val];
  Polinomio f3=new Polinomio(hola,2);
  
  for (int i = 0; i < val; i++) {
    f2[i] = new Polinomio(i+1);
  }
  
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
  
      
  RefQueue<PVector> PC;
  PVector temp;
  grafica.addElement(f3);
  if(f3.grado != 1){
    PC = getPC(f3,grafica);
    while(!PC.isEmpty()){
      temp = PC.dequeue();
      System.out.printf("Elipse ... aux.x: %.2f, aux.y: %.2f\n",temp.x+grafica.getDimension().x/2,f3.getY(temp.x)+grafica.getDimension().y/2);
      fill(0,255,0);
      ellipse(temp.x+grafica.getDimension().x/2,f3.getY(temp.x)+grafica.getDimension().y/2,100,100);
    }
  }  
  
  background(255);
  //print((millis()-count));

  grafica.setDimension(width, height);
  fill(0,255,0);
  ellipse(255,255,100,100);
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
