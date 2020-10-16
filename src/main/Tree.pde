public class Tree<T> {
  private SingleNode head;
  private int nodecout = 0;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo 
  private class SingleNode
  { 
    T Data;
    SingleNode next[];
  }
  public Tree() {
    String[] lines = loadStrings("Hello.txt");
    for (int i = 0 ; i < lines.length; i++) {
      if(lines[i].charAt(0) != 9){
        println(i);
      }
      for(int h = 0; h < lines[i].length(); h++){
        if(lines[i].charAt(h) == 9){
          print("tab ");
        } 
      }
      println(lines[i]);
    }
  }
}
