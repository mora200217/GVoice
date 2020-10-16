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
