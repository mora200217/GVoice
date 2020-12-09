import websockets.*;

WebsocketServer socket;
import java.awt.Desktop;  

String APP_NAME = "GVoice";  
int keyVal = 0;  // 1 Ivan 2 Juanfer 3 Miguel 4 Morales
GraphController grafica; 
PGraphics ui; 
boolean render = true; 
int count2 = 0; 
int val = 1;
boolean toChange = true; 
PGraphics image; 
Search search;
boolean bandera=false;
// WebsocketServer socket = new WebsocketServer(this, 1337, "/p5websocket");
GeneratorTest test; 
HeapSet dibujar, eliminar, deshacer; 
STT stt; 
UI gui; 

// -----------------------------------------
void setup() {
  dibujar = new HeapSet();
  eliminar = new HeapSet();
  deshacer = new HeapSet();

  //---
  dibujar.add("graf", 3);
  dibujar.add("graph", 2);
  dibujar.add("dibujar", 2);
  dibujar.add("pintar", 1);
  dibujar.add("trazar", 1);
  //---
  search = new Search();
  File file = search.getDataFolder();
  Desktop desktop = Desktop.getDesktop();  
  try {
    if (file.exists())         //checks file exists or not  
      desktop.open(file);              //opens the specified file
  }
  catch(Exception e) {
    println("F");
  }
  search.getDataFolder(); 
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
  println(msg);
  int primo=9973;

  if (grafica.peticionrec) {
    //msg tiene que pasar por el hash
    if (bandera) {
      String[] strings = msg.split(" ");
      float[] coef=new float[strings.length];
      int conta=0;
      for (String s : strings) {
        coef[conta]= s.compareTo(" ") == 0 ? 0 : float(0 + s)  ; // v: ;
        conta++;
      }
      for (int ja=0; ja<coef.length; ja++)
        println(coef[ja]);
      grafica.addPolinomio(new Polinomio(coef, coef.length-1));
      grafica.generateImage();
      bandera=false;
      grafica.peticionrec=false;
    } else {
      boolean found = false; 
      int count = 0; 
      while (count <= 4 &&dibujar.count <= dibujar.total && !found) {
        count ++; 
        Word h = dibujar.get(); 
        while (count <= dibujar.total - 1) {
          println("Pasando por: " + h.data); 
          if (count >= 4) {
            println("No se encontró"); 
            dibujar.change(); 
            break;
          } else if (Hash.search(h.data, msg, primo)) {
            h.weight++;
            dibujar.addToSecond(h);
            dibujar.update(); 
            println("Encontrado");
            
            found = bandera = true; 
            break;
          } else {
             count++;  
            dibujar.addToSecond(h);
            h = dibujar.get();
          }
        }
        if (dibujar.count >= dibujar.total) {
          bandera =false;
          dibujar.update();
        } else {
          println("dime los coeficientes");
          // bandera = true;
        }

        dibujar.count = 0;
      }
    }

    println(bandera);
    /*
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
     */
  }
}
