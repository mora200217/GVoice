/**
 * Cola Referencias ( RefQueue )
 * 
 *  Estructura basada en Nodos enlazados, 
 *  por referencias. 
 */
public class RefQueue<T> implements  QueueGen<T> {
  private SingleNode comienzo, fin;
  private int contador;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo
  private class SingleNode
  { 
    T Data;
    SingleNode next;
  }
  public RefQueue() {
    comienzo = null;
    fin= null;
    contador = 0;
  }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
  public T deQueue() {
    T data = comienzo.Data;
    comienzo = comienzo.next;
    if (empty()) 
    {
      fin = null;
      throw new RuntimeException("la cola esta vacia");
    }
    contador--;
    return data;
  }
  /**
   *  inserta un elemento.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void enQueue(T item) {
    SingleNode memo = fin;
    fin = new SingleNode();
    fin.Data = item;
    fin.next = null;
    if (empty()) 
    {
      comienzo= fin;
    } else 
    {
      memo.next = fin;
    }
    contador++;
  }
  /**
   *  retorna si la cola esta vacia o no.
   *  @param {}.
   *  @return{Boolean} -esta vacia. 
   **/
  public boolean empty() {
    return (comienzo==null);
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
   *  retorna la cantidad de elementos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero elementos en la cola. 
   **/
  public int numInside() {
    return contador;
  }
}
