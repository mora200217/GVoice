import websockets.*;

WebsocketServer socket;

String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
PGraphics ui; 
boolean render = true; 
int count2 = 0; 
int val = 1;
boolean toChange = true; 
PGraphics image; 
// WebsocketServer socket = new WebsocketServer(this, 1337, "/p5websocket");
GeneratorTest test; 
STT stt; 
UI gui; 

// -----------------------------------------
void setup() {
  // stt = new STT(this);  

  test = new GeneratorTest(); 
  //int count = millis();
  val = 0;
  size(900, 500);
  ui = createGraphics(40, 40);
  surface.setTitle(APP_NAME);
  surface.setResizable(false); 
  grafica = new  GraphController(width, height);

  grafica.setOrigin(width/2, height/2);
  gui = new UI(width, height, grafica); 
  grafica.setDimension(width, height);
  socket = new WebsocketServer(this, 1337, "/p5websocket");
}
// -----------------------------------------

void UI() {


  float B_RAD = 40; 
  float OFFSET = 15; 
  Button b = new Button(width - B_RAD - OFFSET, height - B_RAD - OFFSET, B_RAD);
  b.update();
  b.draw(); 

  int n = floor(random(2, 8));
  float[] coeff = new float[n]; 
  for (int i = 0; i < n; i ++) {
    coeff[i] = random(3, 80) / 200;
  }

  Polinomio f4 = new Polinomio(coeff, n - 1); 

  // Agregar gráfica
  if ( b.isMousePressed() && toChange) {
    grafica.addPolinomio(f4);

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


void webSocketServerEvent(String msg) {
    if (grafica.peticionrec){
      String[] strings = msg.split(" ");
      println(msg);
      for (String s: strings){
        println("Valor: " + s);
        // Hash v: -----------

        if (s.compareTo("graficar") == 0 ||s.compareTo("grafica") == 0||s.compareTo("graph") == 0){
          println("Agregado"); 
          grafica.addPolinomio(new Polinomio(2)); 
          grafica.generateImage(); 
        }
    }
    }
  
}
