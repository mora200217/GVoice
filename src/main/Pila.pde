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
   *  Revisa el Polinomioo en top.
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
   *  saca un Polinomioo.
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
   *  inserta un Polinomioo.
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
   *  retorna la cantidad de Polinomioos en la cola.
   *  @param {}.
   *  @return{Intiger} -numero Polinomioos en la cola. 
   **/
  public boolean empty() {
    return numInside <= 0;
  }
}
