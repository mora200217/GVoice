 //implementacion de cola generica usando array
 interface ColaGen<T> {
  abstract  public boolean vacio();
  abstract  public boolean lleno();
  abstract public int numAdentro();
  abstract public T atender();
   abstract public void meter(T item);
   
}
public class Cola<T> implements  ColaGen<T>{
  private static final int N = 5;
  private int comienzo, fin, contador;
  private T[] qarray;
  public Cola(){
    this(N);
    }
  public Cola(int N) {
    comienzo = fin = contador = 0;
    qarray = (T[]) new Object[N];
  }
  public T atender() {
    T item = null;
    if(vacio())
      throw new RuntimeException("la cola esta vacia");
    else {
      item = qarray[comienzo];
      comienzo = (comienzo + 1) % N;
      contador--;
    }
    return item;
  }
  public void meter(T item) {
    if(lleno())
      throw new RuntimeException("no hay espacio");
    else {
      qarray[fin] = item;
      fin = (fin + 1) % N;
      contador++;
    }
  }
  public boolean vacio() {
    return contador <= 0;
  }
  public boolean lleno() {
    return contador >= N;
  }
  public int numAdentro() {
    return contador;
  }
}
