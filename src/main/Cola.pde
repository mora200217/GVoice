/**
 * Cola Array ( Queue )
 * 
 *  Estructura basada en arrays, 
 *  Consta de 1 array. 
 */
interface QueueGen<T> {
  abstract  public boolean empty();
  abstract  public boolean full();
  abstract public int numInside();
  abstract public T deQueue();
  abstract public void enQueue(T item);
}
public class Queue<T> implements  QueueGen<T> {
  private static final int N = 5;
  private int comienzo, fin, contador;
  private T[] qarray;
  public Queue() {
    this(N);
  }
  public Queue(int N) {
    comienzo = fin = contador = 0;
    qarray = (T[]) new Object[N];
  }
  /**
   *  saca un elemento.
   *  Maneja Excepción de espacio.
   *  @param {}.
   *  @return{Type} - Éxito del proceso. 
   **/
  public T deQueue() {
    T item = null;
    if (empty())
      throw new RuntimeException("la cola esta vacia");
    else {
      item = qarray[comienzo];
      comienzo = (comienzo + 1) % N;
      contador--;
    }
    return item;
  }
  /**
   *  inserta un elemento.
   *  Maneja Excepción de espacio.
   *  @param {Type}.
   *  @return{} -Exito del proceso. 
   **/
  public void enQueue(T item) {
    if (full())
      throw new RuntimeException("no hay espacio");
    else {
      qarray[fin] = item;
      fin = (fin + 1) % N;
      contador++;
    }
  }
  /**
   *  retorna si la cola esta vacia o no.
   *  @param {}.
   *  @return{Boolean} -esta vacia. 
   **/
  public boolean empty() {
    return contador <= 0;
  }
  /**
   *  retorna si la cola esta llena o no.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean full() {
    return contador >= N;
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
