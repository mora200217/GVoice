public class Tree<T> {
  private SingleNode head;
  private int nodecout = 0;
  //se crea una clase interna como explico el profesor para que solo la pila pueda acceder al nodo 
  private class SingleNode
  { 
    T Data;
    T characteristics[];
    SingleNode next[];
  }
  public Tree() {
    String[] lines = loadStrings("Tree.txt");
    int cont = 0 ;

    
    for (int i = 0 ; i < lines.length; i++) {
      if(lines[i].charAt(0) != 46){
      
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
