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
