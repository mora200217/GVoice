public class Heap {
  private final int n = 20;
  private PVector[] array;
  private int size;
  
  public Heap(Polinomio pol, GraphController graph) {
    array = new PVector[pol.getPoints(graph).length];
    size = 0;
  }
  
  public void insertItem(PVector x) {
    array[size] = x;
    moveUp();
    size++;
  }

  private void moveUp() {
    int child = size;
    int parent = (child-1)/2;
    PVector temp = array[child];
    while(child > 0 && temp.y < array[parent].y) {
      array[child] = array[parent];
      child = parent;
      parent = (child-1)/2;
    }
    array[child]=temp;
  }

  public PVector removeMin() {
    PVector min=array[0];
    array[0]=array[--size];
    moveDown();
    return min;
  }
  
  private void moveDown() {
    boolean flag = false;
    PVector smallest = new PVector(-1,-1);
    int parent = 0;
    int child = 2*parent+1;
    PVector temp = array[parent];
    while(child < size && !flag) {
      smallest = array[child];
      if(child+1 < size && array[child+1].y < array[child].y)
        smallest = array[++child];
      if(smallest.y < temp.y) {
        array[parent] = smallest;
        parent = child;
      }
      else
        flag = true;
      child = 2*parent+1;
    }
    array[parent] = temp;
  }
   
}
