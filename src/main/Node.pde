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
