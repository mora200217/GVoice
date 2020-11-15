import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {

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
public void setup() {

  test = new GeneratorTest(); 
  //int count = millis();
  val = 0;
  
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

public void UI() {
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
public void draw() {
  background(255);
  grafica.draw();


  UI();
}


public void mousePressed() {
   
}

public void mouseReleased() {
  
  toChange = true; 
  grafica.generateImage();
}


class AxisSystem {
  private float[] xInterval = {-10, 10};
  private float[] yInterval = {-10, 10};

  private PVector origin;
  private PVector dimension;

  private Queue<PVector> moveQueue; 

  public AxisSystem(PVector origin, PVector dimension) {
    this.origin = origin; 
    this.dimension = dimension;
    // this.moveQueue = new Qu
  }

  public void setOrigin(float x, float y) {
    this.origin = new PVector(x, y);
  }

  public PVector getOrigin() {
    return this.origin;
  }

  public void setDimension(float x, float y) {
    this.dimension = new PVector(x, y);
  }


  public void draw() {
    // (255);
    stroke(200); 
    // vertical
    line(this.origin.x, 0, this.origin.x, height);
    // horizontal
    line(0, this.origin.y, width, this.origin.y );

    // Texto 
    fill(23); 
    text("y", this.origin.x - 15, 20);
    text("x", width - 20, this.origin.y + 15);
  }
}
class Button {
  private PVector pos; 
  private float RAD; 
  private float offset; 
  private boolean isScaled; 

  Button(float posX, float posY, float RAD) {
    this.pos = new PVector(posX, posY); 
    this.RAD = RAD;
    this.isScaled = false; 
    this.offset = 2;
  }

  Button(float posX, float posY) {
    this(posX, posY, 20);
  }

  private void transition() {
    println("Transition");
  }


  public void update() {
    if (this.isMouseOver() && !isScaled) {
      isScaled = true; 
      this.scale(10);
    } else {
      this.scale(0.1f);
      isScaled = false;
    }

    if (this.isMousePressed())
      print("Pressed");
  }


  public void draw() {
    if (this.isMouseOver())
      cursor(HAND);
    noStroke(); 
    fill(23, 23, 23); 
    ellipse(this.pos.x, this.pos.y, this.RAD + this.offset, this.RAD + this.offset);
    rectMode(CENTER); 
    fill(255);
    rect(this.pos.x, this.pos.y, this.RAD * 3/7, 3);
    rect(this.pos.x, this.pos.y, 3, this.RAD * 3/7); 
  }

  public boolean isMousePressed() {
    return this.isMouseOver() && mousePressed;
  }

  public void scale() {
    this.scale(2); // Por defecto
  }

  public void scale(float s) {

    this.offset *= s;
  }

  public boolean isMouseOver() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(this.pos); 
    return mouse.mag() < this.RAD;
  }
}
/**
 * Cola Array ( Queue )
 * 
 *  Estructura basada en arrays, 
 *  Consta de 1 array. 
 */
interface QueueGen<T> {
  
  abstract public boolean isEmpty();
  abstract public boolean isFull();
  abstract public int numInside();
  abstract public T peek(); 
  abstract public T dequeue();
  abstract public void enqueue(T item);
  
}
public class Queue<T> implements  QueueGen<T> {
  private static final int N = 5;
  private int front, rear, count;
  private T[] qarray;
  
  public Queue() {
    this(N);
  }
  public Queue(int N) {
    front = rear = count = 0;
    qarray = (T[]) new Object[N];
  }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
  public T dequeue() {
    T item = null;
    if (isEmpty())
      throw new RuntimeException("la cola esta vacia");
    else {
      item = qarray[front];
      front = (front + 1) % N;
      count--;
    }
    return item;
  }
  /**
   *  inserta un elemento.
   *  Maneja Excepción de espacio.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void enqueue(T item) {
    if (isFull())
      throw new RuntimeException("no hay espacio");
    else {
      qarray[rear] = item;
      rear = (rear + 1) % N;
      count++;
    }
  }
  
  public T peek(){
    return qarray[front]; 
  }

  /**
   *  retorna si la cola esta vacia o no.
   *  @param {}.
   *  @return{Boolean} -esta vacia. 
   **/
  public boolean isEmpty() {
    return count <= 0;
  }
  /**
   *  retorna si la cola esta llena o no.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean isFull() {
    return count >= qarray.length;
  }
  /**
   *  retorna la cantidad de elementos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero elementos en la cola. 
   **/
  public int numInside() {
    return count;
  }
}
/**
 * Cola Referencias ( RefQueue )
 * 
 *  Estructura basada en Nodos enlazados, 
 *  por referencias. 
 */
public class RefQueue<T> implements  QueueGen<T> {
  private SingleNode front, rear;
  private int count;
  
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo
  
  private class SingleNode
  { 
    public T data;
    public SingleNode next;
  }
  
  
  public RefQueue() {
    front = null;
    rear= null;
    count = 0;
  }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
  public T dequeue() {
    T data = front.data;
    front = front.next;
    if (isEmpty()) 
    {
      rear = null;
      throw new RuntimeException("la cola esta vacia");
    }
    count--;
    return data;
  }
  /**
   *  inserta un elemento.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void enqueue(T item) {
    SingleNode memo = rear;
    rear = new SingleNode();
    rear.data = item;
    rear.next = null;
    if (isEmpty()) 
    {
      front= rear;
    } else 
    {
      memo.next = rear;
    }
    count++;
  }
  /**
   *  retorna si la cola esta vacia o no.
   *  @param {}.
   *  @return{Boolean} -esta vacia. 
   **/
  public boolean isEmpty() {
    return (count<=0);
  }
  
  public T peek(){
     return front.data;  
  }
  /**
   *  retorna si la cola esta "llena" al ser por listas nunca se llena.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean isFull() {
    return(false);
  }
  /**
   *  retorna la cantidad de elementos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero elementos en la cola. 
   **/
  public int numInside() {
    return count;
  }
}
/**
 * Array Dinamico ( DynamicArray )
 * 
 *  implementacion de un array dinamico con factor 2, 
 *  Consta de 1 array que puede cambiar su tamaño durante el tiempo de ejecucion. 
 */
interface DynamicArrayGen<T> {
  abstract public int length();
  abstract public T get(int i);
  abstract public void set(int i, T j);
}

public class DynamicArray<T> implements DynamicArrayGen<T> {
  private static final int N = 2;
  private T[] array;
  private int size; // Número internos  
  private int n = 0; 
  
  public DynamicArray() {
    this(N);
  }
  public DynamicArray(int N) {
    array = (T[]) new Object[N];
  }
  /**
   *  inserta un elemento en el indice dado si el indice es mayor al del array duplica el tamaño del array.
   * 
   *  @param {integer,Type} .
   *  @return{} - Éxito del proceso. 
   **/
  public void set(int index, T data) {
   
    int lenin=array.length;
    while (lenin <= index) {
      lenin= 2 * lenin;
    }
    
    if( lenin <= array.length){
  
      array[index]=data;
    }
    
    else{
     T[] tempoarray = (T[]) new Object[lenin];
     
     for(int f=0;f<array.length;f++){
       tempoarray[f]=array[f];
     }
     array=tempoarray;
     tempoarray=null;
     array[index-1]=data;
    }
  }
    /**
   *  retorna el elemento en el indice dado si el indice es mayor al del array retorna una excepción.
   *  Maneja Excepción de index maximo.
   *  @param {integer} .
   *  @return{Type} - Éxito del proceso. 
   **/
  public T get(int i) {
    T elemento;
    if(array.length>i){
     elemento=array[i];
    }
    else{
      throw new RuntimeException("el elemento no existe");
    }
     return elemento ;
  }
      /**
   *  retorna la longitud actual maxima del array.
   *  @param {} .
   *  @return{Integer} -retorna la longitud del array. 
   **/
  public int length() {
    return array.length;
  }
  
  public void pushBack(T data){
    this.set(n, data); 
    n++; 
  }
  
  public T popBack(){
      T returnElement = this.get(n); 
      n--; 
      return returnElement; 
  }
  
  public boolean isEmpty(){
      return n <= 0; 
  }
  
}
interface Element{
    abstract public float[] getPoints(GraphController h);
    abstract public float getDelta();
   }
/**
 * Elipse ( Elipse )
 * implementacion para obtener los puntos de una ellipse
 */
public class Elipse implements Element {
  //Declaración de variables funcionales tanto para la elipse como para el círculo 
  PVector centroide = new PVector(0, 0);
  private float radio_may = 1;
  private float radio_men = 1;
  private float delta=0;
  public int control=0;
  //Constructor para el círculo 
  public Elipse(float x, float y, float radio) {
    this.delta=1;
    this.centroide.x = x;
    this.centroide.y = y;
    this.radio_may = radio;
    this.radio_men = radio_may;
  }
  //Constructor para la elipse
  public Elipse(float x, float y, float may, float men) {
    this.delta=1;
    this.centroide.x = x;
    this.centroide.y = y;
    this.radio_may = may;
    this.radio_men = men;
  }
  /**
   *  Retorna dos valores de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float[]} los dos puntos de Y para el X dado. 
   **/
  public float[] f (float x) {
    //variables
    float []f = new float[2];
    f[0] = 0;
    f[1] = 0; 
    f[0] = sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;
    f[1] = -sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;

    return f;
  }
  /**
   *  Retorna los puntos de y para el eje coordenado al pedirlo la primera vez retorna los positivos la segunda los negativos.
   *  
   *  @param {GraphController} sistema grafico donde se va a evaluar.
   *  @return{Float[]} los dos puntos de Y para el sistema grafico. 
   **/
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float[]points= new float [ceil(size/this.delta)];
    for (float i=0; i<size; i+=delta) {
      points[PApplet.parseInt(i/delta)]=this.f(i-size/2)[control];
    }
    if (control==0) {
      control=1;
    } else {
      control=0;
    }
    return points;
  }
  /**
   *  Retorna el delta evaluado.
   *  
   *  @param {} .
   *  @return{Float} retorna delta. 
   **/
  public float getDelta() {
    return delta;
  }
}
class GeneratorTest {
  protected class Record {
    private int time; 
    private int size;  
    Record(int time) {
      this.time = time;
      this.size = 0;
    }
  }


  private long countTime, countSize; 
  private LinkedList<Record> data; 
  private boolean hasSentRecord = false; 

  GeneratorTest() {
    println("Iniciando generador de prueba");
    data = new LinkedList<Record>();
  }

  public void beginSample() {
    this.countTime = System.nanoTime();
    this.countSize = System.nanoTime();
  }

  public void endSample() {
    this.step(System.nanoTime() - this.countTime);
  }

  private void step(long time) {
    println(time / 1000000);
    data.pushRear(new Record((int) time / 1000000));
  }

  public void createReport(String type) {
    switch(type) {
      // ---------------------------
    case "txt": 
      PrintWriter output; 
      output = createWriter("prueba.txt");
      output.println("C" + " " + "T");

      Node<Record> dataList[] = data.getNodesList(); 

      int total = 0; 
      for (int i = 0; i < dataList.length; i++ ) {
        println("VALOR _ " + dataList[i].value.time); 
        output.println(i + " "  + dataList[i].value.time);
        total += dataList[i].value.time; 
      }
        
      output.println("TOTAL: " + total); 
      output.close();

      break; 
      // ---------------------------
    case "csv":

      break;
    }
  }
}
class GraphController {
  private PVector origin;
  private PVector dimension;
  private int id; 
  private int amountOfElements; 
  private boolean visibility; // Is Visible ?   
  private boolean rendering;  // Will render ? 
  private int MAX_GRAPHS_PER_CYCLE = 1;   

  public PGraphics imgToShow; 
  private boolean hasToGenerate = true; 
  // private PImage bg; 

  private Stack<PVector> dragPositions; 
  private QueueGen<Element>inScreen=new RefQueue();
  private LinkedList<Float> valuesToGraph = new LinkedList(); 


  private Stack<PGraphics> graphsArray = new Stack(1000);

  private AxisSystem axis; 
  private int step = 0; 
  private PGraphics pg; 

  //public RefStack<> actionHistory 

  public GraphController() {
    this(100, 100);
  }

  public GraphController(float x, float y) {
    imgToShow = createGraphics(width, height); 
    origin = new PVector(x, y); 
    dimension = new PVector(500, 500); 
    axis = new AxisSystem(origin, dimension); 
    dragPositions = new Stack<PVector>(200); 
    // bg = loadImage("bg.png");
    pg = createGraphics(width, height);
  }

  public PVector getOrigin() {
    return this.origin;
  }

  public int numGraphs() {
    return inScreen.numInside();
  }

  public void setOrigin(float x, float y) {
    this.origin = new PVector(x, y);
    this.axis.setOrigin(x, y);
  }

  public boolean isVisible() {
    return this.visibility;
  }

  public void toggleVisibility() {
    this.visibility = !this.isVisible();
  }

  public PVector getDimension() {
    return this.dimension;
  }

  public void setDimension(float x, float y) {
    this.dimension = new PVector(x, y);
    this.axis.setDimension(x, y);
  }
  public void addElement(Element cosa) {
    inScreen.enqueue(cosa);
  }

  private void savePoints(Element e) {
    float points[] = e.getPoints(this);
    PGraphics pg = createGraphics(width, height); // CAMBIAR

    pg.beginDraw(); 

    pg.push();
    pg.translate(this.axis.getOrigin().x - this.getDimension().x/2, this.axis.getOrigin().y);
    pg.rotate(radians(180));
    pg.scale(-1, 1);
    pg.noFill(); 
    pg.stroke(23);
    pg.beginShape();
    for (int i = 0; i < points.length; i ++)
      pg.curveVertex(i* e.getDelta(), points[i]);
    pg.endShape();
    pg.pop();

    pg.endDraw(); 
    graphsArray.push(pg);
  }

  public PGraphics generateImage() {
    Element memoria;

    for (int j = 0; j < inScreen.numInside(); j++) {
      memoria= inScreen.dequeue();
      this.savePoints(memoria); // Guarda los puntos como imagen
      inScreen.enqueue(memoria);
    }

    PGraphics pgf = createGraphics(width, height);

    pgf.beginDraw(); 

    while (!graphsArray.empty())
      pgf.image(graphsArray.pop(), 0, 0);
    pgf.endDraw();

    this.imgToShow = pgf;

    return pgf;
  }

  public void draw() {
    this.axis.draw();
    this.update();
    if (mousePressed) {
    }
    imageMode(CENTER); 
    image(this.imgToShow, this.origin.x, this.origin.y);
  }

  public Element headReference() {
    return inScreen.peek();
  }

  public boolean isMouseOver() {
    return true;
  }


  public boolean mouseDragged() {
    return this.isMouseOver() && mousePressed;
  }

  public void update() {
    // Mouse encima 
    if (this.isMouseOver())
      cursor(MOVE); 
    else
      cursor(ARROW);


    // Mouse drag
    if ( this.mouseDragged() ) {
      dragPositions.push(new PVector(mouseX, mouseY));
      this.hasToGenerate = true;
    } else if (!dragPositions.empty() && dragPositions.numInside < 2) {
      dragPositions.pop();
    }

    if (!dragPositions.empty() && dragPositions.numInside > 2) {
      PVector posToLoad = dragPositions.pop(); 
      PVector posToLoad_2 = dragPositions.pop();
      PVector finalPos = posToLoad.sub(posToLoad_2); 
      PVector actual = this.axis.getOrigin();

      finalPos.normalize().mult(10).add(actual);

      System.out.printf("x: %.2f, y: %.2f\n", finalPos.x, finalPos.y);
      this.axis.setOrigin(finalPos.x, finalPos.y);

    }
  }
}
/**
 * Lista Enlazada ( LinkedList )
 * 
 *  Estructura basada en enlazamiento de instancias de tipo Nodo, 
 *  por referencias. Consta de dos Nodos principales: 
 *      - { Node } front: referencia al nodo cabeza de la lista (primero)
 *      - { Node } rear: referencia al nodo cola de la lista (último)
 */

public class LinkedList<T> {

  private Node<T> front; 
  private Node<T> rear;
  private int n; 

  public LinkedList() {
    this.front = null;
    this.rear = null; 
    this.n = 0;
  }

  /**
   *  Verifica que no esté vacía la lista. 
   * 
   *  @return { boolean } - si el front es null, la lista está vacía.
   */

  public boolean isEmpty() {
    return front == null;
  }  


  /**
   *  Agrega un elemento al frente de la lista. 
   *  @param { Node } Element - Nodo a agregar a la lista.
   *  @return  { Boolean } - Éxito del proceso. 
   **/

  public boolean pushFront(Node element) {
    // Si la lista está vacía 
    if (this.isEmpty()) {
      this.front = element; 
      this.rear = element;
    } else {
      element.setNext(this.front);
      this.front.setPrev(element); 
      this.front = element;
    }; 
    this.n++; 
    return true;
  }

  public boolean pushFront(T data) {
    this.pushFront(new Node<T>(data)); 
    return true;
  }

  /**
   * Maneja Excepción de espacio. 
   * 
   * En caso de heredar la clase, implementar este método 
   * acorde a la clase creada. 
   */

  public void handleException() {
    throw new RuntimeException("La lista está vacía");
  }

  /**
   * Devuelve el Nodo de front. 
   * 
   * @return { Node } newNode - Nodo frontal de la lista. 
   */

  public Node popFront() {
    if (this.isEmpty())
      this.handleException();

    Node newNode = this.front; 
    this.front = this.front.getNext(); 

    this.n --; // Actualizar cantidad de Nodos 

    return newNode;
  }

  /**
   *   Agrega un nodo al final de la lista.
   *  
   *   @param { Node } nodeToRear - Nodo a agregar.
   *   @return { Boolean } Proceso éxitoso.
   **/
  public boolean pushRear(Node nodeToRear) {
    nodeToRear.setPrev(this.rear); 
    if (this.rear == null) {
      this.front = this.rear = nodeToRear;
      return true;
    }

    this.rear.setNext(nodeToRear); 
    this.rear = nodeToRear;
    this.n++; 
    return true;
  }


  public void pushRear(T e) {
    this.pushRear(new Node<T>(e));
  }
  /**
   *  Hace pop del últmo elemento.
   *
   *  Retorna el último Nodo de la lista y lo elimina.
   *  
   *  @return { Node } toReturn - El último nodo. 
   **/

  public Node popRear() {
    this.rear = this.rear.getPrev(); 
    Node toReturn = this.rear.getNext(); 
    this.rear.setNext(null); 
    this.n--; 
    return toReturn;
  }


  /**
   *  Retorna el nodo en la posición dada.
   *  
   *  En caso de no encontrar ingresar una posición inválida, 
   * se genera un error.
   * 
   * @param { int } i - Posición a buscar. 
   * ®return { Node } walker - Nodo encontrado en la posición.
   **/

  public Node getFromPosition(int i) {
    if (i > this.n)
      throw new IndexOutOfBoundsException("Excediste el límite de los elementos en la lista"); 
    else if (i < 0)
      throw new IndexOutOfBoundsException("No se admiten índices negativos"); 

    Node walker = this.front; 
    for (int index = 0; index < i; index++) {
      walker = walker.getNext();
    }

    return walker;
  }

  /**
   * Agrega un nodo después de la posición indicada. 
   *
   * @param { Node } node - nodo a agregar. 
   * @param { int } i -  posición previa del nodo a agregar. 
   */
  public void pushAfter(Node node, int i) {
    Node ref = this.getFromPosition(i); 

    // Si es el último
    if (this.rear == ref)
      this.pushRear(node); 
    else {
      ref.getNext().setPrev(node); 
      node.setNext(ref.getNext());
      node.setPrev(ref); 
      ref.setNext(node);
    }
  }

  /**
   * Agrega un nodo antes de la posición indicada. 
   *
   * @param { Node } node - nodo a agregar. 
   * @param { int } i -  posición posterior del nodo a agregar. 
   **/
  public void pushBefore(Node node, int i) {
    // Si es el primero 
    if (i == 0)
      this.pushFront(node); 
    else {
      this.pushAfter(node, i - 1);
    }
  }


  /**
   * Devuelve la cantidad de nodos en la lista.
   * 
   * @return {Integer} this.n - cantidad de nodos.
   */
  public int amountOfElements() {
    return this.n;
  }

  /**
   * Imprime la lista de todos los elementos de menor a mayor. 
   *
   **/
  public void printElements() {
    Node np = this.front; 
    while (np != null) {
      System.out.printf("%d ", np.value); 
      np = np.getNext();
    }
    System.out.printf("\n");
  }

  public Node[] getNodesList() {
    Node<T> np = this.front;

    Node[] s = new Node[this.n + 1];
    int c = 0;

    while (np != null) {
      s[c] = np; 
      c++; 
      np = np.next;
    }
    return s;
  }
}
/**
 * Nodo ( Node )
 * 
 *  implementacion de un Nodo, 
 *  Consta de un nodo doble el cual cuenta con la referencia al siguiente y al anterior y almacena un dato. 
 */
class Node<T> {
  public T value; 
  Node next; 
  Node prev; 

  public Node(T value) {
    this.value = value;
  }
  public  Node() {
    this.value = null;
  }
  /**
   *  asigna el puntero siguente a un nodo
   *  @param {Node}.
   *  @return{} - Éxito del proceso. 
   **/
  public void setNext(Node newRef) {
    this.next = newRef;
  }
  /**
   *  retorna el puntero siguiente del nodo
   *  @param {}.
   *  @return{Node} - Éxito del proceso. 
   **/
  public Node getNext() {
    return this.next;
  }
  /**
   *  asigna el puntero anterior a un nodo
   *  @param {Node}.
   *  @return{} - Éxito del proceso. 
   **/
  public void setPrev(Node newPrev) {
    this.prev = newPrev;
  }
  /**
   *  retorna el puntero anterior del nodo
   *  @param {}.
   *  @return{Node} - Éxito del proceso. 
   **/
  public Node getPrev() {
    return this.prev;
  }
}
/**
 * Parabola ( Parabola )
 * implementacion para obtener los puntos de una Parabola
 */
public class Parabola {
  private float[] vertice = new float[2];
  private float[] foco = new float[2];
  private float[] coeficientes = new float[3];
  private char variable;

  //Constructor sin argumentos de entrada, grafica x^2+2x+1
  public Parabola() {
    coeficientes[0] = 1;
    coeficientes[1] = 2;
    coeficientes[2] = 1;
    variable = 'x';
    foco[1] = 1/(4*coeficientes[0]);
    vertice[0] = -coeficientes[1]*2*foco[1];
    vertice[1] = coeficientes[2]-(pow(vertice[0], 2)/(4*foco[1]));
    foco[0] = vertice[0];
  }

  //Constructor con argumentos de entrada de vertice y foco
  public Parabola(float[] ver, float[] foc) {
    if (foc[0] == ver[0] && foc[1] == ver[1]) {
      throw new RuntimeException("Los datos ingresados no son validos");
    }
    foco[0] = foc[0];
    foco[1] = foc[1];
    vertice[0] = ver[0];
    vertice[1] = ver[1];
    if (foco[0] == ver[0] && foco[1] != ver[1]) {
      variable = 'x';
    } else if (foco[0] != ver[0] && foco[1] == ver[1]) {
      variable = 'y';
    }
  }

  //Constructor con argumentos de entrada de coeficientes del polinomio y la variable a tratar
  public Parabola(float[] coef, char var) {
    coeficientes[0] = coef[0];
    coeficientes[1] = coef[1];
    coeficientes[2] = coef[2];
    variable = var;
    if (variable == 'x') {
      foco[1] = 1/(4*coeficientes[0]);
      vertice[0] = -coeficientes[1]*2*foco[1];
      vertice[1] = coeficientes[2]-(pow(vertice[0], 2)/(4*foco[1]));
      foco[0] = vertice[0];
    } else if (variable == 'y') {
      foco[0] = 1/(4*coeficientes[0]);
      vertice[1] = -coeficientes[1]*2*foco[0];
      vertice[0] = coeficientes[2]-(pow(vertice[1], 2)/(4*foco[0]));
      foco[1] = vertice[1];
    }
  }
  /**
   *  Retorna dos valores de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float} el punto Y para el X dado. 
   **/
  public float dep(float ind) {
    float valor = 0;
    if (variable == 'x') {
      valor = (pow(ind-vertice[0], 2)/(4*foco[1]))+vertice[1];
    } else if (variable == 'y') {
      valor = (pow(ind-vertice[1], 2)/(4*foco[0]))+vertice[0];
    }
    return valor;
  }
}
/**
 * Pila Array ( Stack )
 * 
 *  Estructura basada en arrays, 
 *  Consta de 1 array.
 */
interface StackGen<T> {
  abstract  public boolean empty();
  abstract  public boolean full();
  abstract public T pop();
  abstract public void push(T item);
}
public class Stack<T> implements  StackGen<T> {
  private static final int N= 10;
  public int numInside;
  private T[] arr;
  public Stack() {
    this(N);
  }
  public Stack(int N) {
    numInside = 0;
    arr =(T[]) new Object[N];
  }
    /**
   *  Revisa el elemento en top.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
   public T peek(){
     if (empty()){
       throw new RuntimeException("La pila está vacía");
     }
     return arr[numInside];
   }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/   
  public T pop() {
    if (empty()) {
      throw new RuntimeException("la pila esta vacia");
    }
    numInside--;
    return arr[numInside];
  }
  /**
   *  inserta un elemento.
   *  Maneja Excepción de espacio.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void push(T item) {
    if (full()) {
      throw new RuntimeException("no hay espacio");
    }
    arr[numInside]=item;
    numInside++;
  }
  /**
   *  retorna si la pila esta llena o no.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean full() {
    return numInside >= arr.length;
  }
  /**
   *  retorna la cantidad de elementos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero elementos en la cola. 
   **/
  public boolean empty() {
    return numInside <= 0;
  }
}
/**
 * Pila Ref ( RefStack )
 * 
 *  Estructura basada en Nodos enlazados, 
 *  por referencias. 
 */
public class RefStack<T> implements  StackGen<T> {
  private SingleNode head;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo 
  private class SingleNode
  { 
    T Data;
    SingleNode next;
  }
  public RefStack() {
    head = null;
  }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
  public T pop() {
    if (empty()) {
      throw new RuntimeException("la pila esta vacia");
    }
    T item = head.Data;
    head = head.next;
    return item;
  }
  /**
   *  inserta un elemento.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void push(T item) {
    SingleNode memo = head;
    head = new SingleNode();
    head.Data = item;
    head.next = memo;
  }
  /**
   *  retorna si la cola esta "llena" al ser por listas nunca se llena.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean full() {
    return(false);
  }
  /**
   *  retorna si la pila esta vacia o no.
   *  @param {}.
   *  @return{Boolean} -esta vacia. 
   **/
  public boolean empty() {
    return(head==null);
  }
}
/**
 * Polinomio ( Polinomio )
 * implementacion para obtener los puntos de un polinomio
 */
public class Polinomio implements Element {
  private float[] coef;
  private int grado;
  private float delta=0;
  public PVector pos=new PVector(0, 0);
  public Polinomio(int gradot) {
    grado=gradot;
    this.delta=1;
    this.pos=new PVector(0, 0);
    if (grado < 0) {

      //Evita errores al incluir exponentes menores a 0
      throw new RuntimeException("el grado ingresado no es valido");
    } else {
      coef = new float[grado+1];
      //genero un array almacenando los coeficientes que como no pasaron van a ser 0.
      for (int i = 0; i <= grado; i++) {
        coef[i] =0.3f;
      }
    }
  }
  public Polinomio(float[] coeft, int gradot) {
    grado=gradot;
    this.delta=1;
    if (grado < 0)
      throw new RuntimeException("el grado ingresado no es valido");
    else {
      if (coeft.length-1!=grado)
        throw new RuntimeException("el numero de indices debe concidir con el grado");
    }
    coef = new float[grado+1];
    for (int i = 0; i <= grado; i++) {
      coef[i] = coeft[i];
    }
  }
  /**
   *  Retorna el valor de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float} el punto de Y para el X dado. 
   **/
  public float y(float x) {
    float valor = 0;
    for (int i =0; i<=grado; i++) {
      valor+=(coef[i]*pow(x, i));
      //println(valor);
    }
    return valor;
  }
  /**
   *  Retorna los puntos de y para el eje coordenado.
   *  
   *  @param {GraphController} sistema grafico donde se va a evaluar.
   *  @return{Float[]} los puntos de Y para el sistema grafico. 
   **/
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float[]points= new float [ceil(size/this.delta)];
    for (float i=0; i<size; i+=delta) {
      points[PApplet.parseInt(i/delta)]=this.y(i-size/2);
    }
    return points;
  }
  /**
   *  Retorna el grado del polinomio.
   *  @param {} .
   *  @return{int} el grado del polinomio. 
   **/
  public int grado() {
    return this.grado;
  }
    /**
   *  Retorna el delta evaluado.
   *  
   *  @param {} .
   *  @return{Float} retorna delta. 
   **/
  public float getDelta() {
    return delta;
  }
    /**
   *  permite la suma de un polinimo menor o igual al actual.
   *  
   *  @param {Polinimio} .
   *  @return{} -exito del proceso. 
   **/
  public void suma(Polinomio b) {
    Polinomio a = this;
    if (a.grado <= b.grado) {
      throw new RuntimeException("se le debe sumar al mayor el menor");
    }
    for (int i = 0; i <= b.grado; i++) {
      a.coef[i] += b.coef[i];
    }
  }
}




public void Ivan() {

}

public void Juanfer() {
}


public void Miguel() {
}


public void Morales() {
}
/**
 * TextReader
 * 
 *  Clase que toma un archivo txt 
 *  Devuelve una cola con las palabras del mismo
 *  Permanece en etapa de desarrollo
 *
 */

public class TextReader {
  private String document;
  public RefQueue< String > instructions = new RefQueue(); 
  public TextReader(String input) {
    this.document =  input;
    String[] lines = loadStrings(document);
    for (int line = 0; line < lines.length; line++) {
      String[] words = split(lines[line], " ");

      for (int index = 0; index < words.length; index++) {
        this.instructions.enqueue(words[index]);
      }
    }
  }
  public RefQueue readThis(){
    
    return instructions;
  }
}
public class Tree<T> {
  private SingleNode head;
  private int nodecout = 0;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo 
  private class SingleNode
  { 
    T Data;
    SingleNode next[];
  }
  public Tree() {
    String[] lines = loadStrings("Hello.txt");
    for (int i = 0 ; i < lines.length; i++) {
      if(lines[i].charAt(0) != 9){
      
      }
      for(int h = 0; h < lines[i].length(); h++){
        if(lines[i].charAt(h) == 9){
          print("tab ");
        } 
      }
      println(lines[i]);
    }
  }
}
  public void settings() {  size(700, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
