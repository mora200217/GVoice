
String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
PGraphics ui; 
boolean render = true; 
int count2 = 0; 
int val = 0; 
int tiempototal=0;
// -----------------------------------------
void setup() {
  
  
  //int count = millis();
  val = 10;
  size(700, 500);
  ui = createGraphics(40, 40);
  surface.setTitle(APP_NAME);
  surface.setResizable(true); 
  grafica = new  GraphController(width, height);
  grafica.setOrigin(width/2, height/2);
  Polinomio[] f2 = new Polinomio[val];
  for (int i = 0; i < val; i++) {
    f2[i] = new Polinomio(int(random(0,8)));
    grafica.addElement(f2[i]);
  }
  background(255);
  //print((millis()-count));

  grafica.setDimension(width, height);
  background(255);
}

//-----------------------------------------
void render() {
  Element test = grafica.headReference(); 

  if (render) {

    int count = millis();
    grafica.draw();
    int finalTime = millis() - count; 
    System.out.printf("Tiempo: %d ms - Count: %d \n", finalTime, count2);
    if ( count2  == val ) 
      render = false;
    count2 ++;
    tiempototal+=finalTime;
  }
  System.out.printf("Tiempo: %d ms",tiempototal);
}


// -----------------------------------------
void UI() {
 ui.beginDraw(); 
  Button b = new Button(80, 40, 40);
  b.update();
  b.draw(); 
  grafica.draw();
  Polinomio f3=new Polinomio(frameCount % 3 + 1);
  if (b.isMousePressed())
    grafica.addElement(f3);
  ui.endDraw(); 
}
// -----------------------------------------
void draw() {


  render(); 
  UI();
  image(ui, 0,0); 
}


void mousePressed() {
  //background(255);
  render = true; 
  count2 = 0;
}
void mouseDragged() {
  background(255);
}
