 interface ArrayGen<T> {
  abstract  public boolean vacio();
  abstract  public boolean lleno();
  abstract public T pop();
   abstract public void push(T item);
}
class ArrayPropio<T> implements  ArrayGen<T>{
    private static final int n =4;
    private int limsup;
    private T[] arr;
    public ArrayPropio(){
    this(n);
    }
    public ArrayPropio(int n) {
        limsup = 0;
        arr =(T[]) new Object[n];
    }
    public boolean lleno() {
        return limsup >= arr.length;
    }
    public boolean vacio() {
        return limsup <= 0;
    }
    public T pop() {
    if(vacio()){
        throw new RuntimeException("la pila esta vacia");
    }
    limsup--;
    return arr[limsup];
    }
    public void push(T item) {
        if(lleno()){
            throw new RuntimeException("no hay espacio");
        }
        arr[limsup]=item;
        limsup++;
    }
}
