//implementacion de pila generica usando array
interface PilaGen<T> {
  abstract  public boolean vacio();
  abstract  public boolean lleno();
  abstract public T pop();
  abstract public void push(T item);
}
public class Pila<T> implements  PilaGen<T> {
  private static final int n =4;
  private int limsup;
  private T[] arr;
  public Pila() {
    this(n);
  }
  public Pila(int n) {
    limsup = 0;
    arr =(T[]) new Object[n];
  }
//metodo de sacar de la pila
  public T pop() {
    if (vacio()) {
      throw new RuntimeException("la pila esta vacia");
    }
    limsup--;
    return arr[limsup];
  }
  //metodo de meter en la pila
  public void push(T item) {
    if (lleno()) {
      throw new RuntimeException("no hay espacio");
    }
    arr[limsup]=item;
    limsup++;
  }
  //booleanos de control
    public boolean lleno() {
    return limsup >= arr.length;
  }
  public boolean vacio() {
    return limsup <= 0;
  }
}
