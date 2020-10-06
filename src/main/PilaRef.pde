//implementacion de cola generica usando reff
public class PilaRef<T> implements  PilaGen<T> {
  private SingleNode head;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo 
  private class SingleNode
  { 
    T Data;
    SingleNode next;
  }
  public PilaRef() {
    head = null;
  }
  //metodo de sacar de la pila
  public T pop() {
    if(vacio()){
      throw new RuntimeException("la pila esta vacia");
    }
    T item = head.Data;
    head = head.next;
    return item;
  }
  //metodo de meter en la pila
  public void push(T item) {
    SingleNode memo = head;
    head = new SingleNode();
    head.Data = item;
    head.next = memo;
  }
  //booleanos de control
  //este es para poder usarf la interfas del anterior por que nunca se va a llenar con reff
  public boolean lleno() {
    return(false);
  }
  public boolean vacio() {
    return(head==null);
  }
}
