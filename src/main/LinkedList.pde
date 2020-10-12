/**
 * Lista Enlazada ( LinkedList )
 * 
 *  Estructura basada en enlazamiento de instancias de tipo Nodo, 
 *  por referencias. Consta de dos Nodos principales: 
 *      - { Node } front: referencia al nodo cabeza de la lista (primero)
 *      - { Node } rear: referencia al nodo cola de la lista (último)
 */

public class LinkedList {

  private Node front; 
  private Node rear;
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

  boolean isEmpty() {
    return front == null;
  }  


  /**
   *  Agrega un elemento al frente de la lista. 
   *  @param { Node } Element - Nodo a agregar a la lista.
   *  @return  { Boolean } - Éxito del proceso. 
   **/

  boolean pushFront(Node element) {
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

  /**
   * Maneja Excepción de espacio. 
   * 
   * En caso de heredar la clase, implementar este método 
   * acorde a la clase creada. 
   */

  void handleException() {
    throw new RuntimeException("La lista está vacía");
  }

  /**
   * Devuelve el Nodo de front. 
   * 
   * @return { Node } newNode - Nodo frontal de la lista. 
   */

  Node popFront() {
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
  boolean pushRear(Node nodeToRear) {
    nodeToRear.setPrev(this.rear); 
    this.rear.setNext(nodeToRear); 
    this.rear = nodeToRear;
    this.n++; 
    return true;
  }

  /**
   *  Hace pop del último elemento.
   *
   *  Retorna el último Nodo de la lista y lo elimina.
   *  
   *  @return { Node } toReturn - El último nodo. 
   **/

  Node popRear() {
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

  Node getFromPosition(int i) {
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
  void pushAfter(Node node, int i) {
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
  void pushBefore(Node node, int i) {
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
  int amountOfElements() {
    return this.n;
  }

  /**
   * Imprime la lista de todos los elementos de menor a mayor. 
   *
   **/
  void printElements() {
    Node np = this.front; 
    while (np != null) {
      System.out.printf("%d ", np.value); 
      np = np.getNext();
    }
    System.out.printf("\n");
  }
}
