//implementacion de cola generica usando reff
public class ColaRef<T> implements  ColaGen<T> {
  private SingleNode comienzo, fin;
  private int contador;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo
  private class SingleNode
  { 
    T Data;
    SingleNode next;
  }
  public ColaRef() {
    comienzo = null;
    fin= null;
    contador = 0;
  }
  //metodo dequeue
  public T atender() {
    T data = comienzo.Data;
    comienzo = comienzo.next;
    if (vacio()) 
    {
      fin = null;
      throw new RuntimeException("la cola esta vacia");
    }
    contador--;
    return data;
  }
  //metodo enqueue
  public void meter(T item) {
    SingleNode memo = fin;
    fin = new SingleNode();
    fin.Data = item;
    fin.next = null;
    if (vacio()) 
    {
      comienzo= fin;
    } else 
    {
      memo.next = fin;
    }
    contador++;
  }
  //booleanos de control
  public boolean vacio() {
    return (comienzo==null);
  }
  public boolean lleno() {
    return(false);
  }
  //contador de elementos en la cola
  public int numAdentro() {
    return contador;
  }
}
