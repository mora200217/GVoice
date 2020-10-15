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
  private static final int n =10;
  private int limsup;
  private T[] arr;
  public Stack() {
    this(n);
  }
  public Stack(int n) {
    limsup = 0;
    arr =(T[]) new Object[n];
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
    limsup--;
    return arr[limsup];
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
    arr[limsup]=item;
    limsup++;
  }
  /**
   *  retorna si la pila esta llena o no.
   *  @param {}.
   *  @return{Boolean} -esta llena. 
   **/
  public boolean full() {
    return limsup >= arr.length;
  }
  /**
   *  retorna la cantidad de elementos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero elementos en la cola. 
   **/
  public boolean empty() {
    return limsup <= 0;
  }
}
