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
    if (isEmpty()) {
      rear = null;
      throw new RuntimeException("la cola esta vacia");
    }
    T data = front.data;
    front = front.next;


    count--;
    return data;
  }

  public void deleteLast() { 
    if (!this.isEmpty()) {
      T e = this.dequeue();
      this.enqueue(e); 
      T e2 = null; 
      while (this.peek() != e) {
        e2 = this.dequeue(); 
        if(this.peek() != e)
        this.enqueue(e2); 
      }
      
      
    }
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

  public T peek() {
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
