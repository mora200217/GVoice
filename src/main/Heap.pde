public class Heap<T extends Comparable<T>> {
  private final int n = 20;
  private T[] array;
  private int size;
  
  public Heap() {
    array=(T[]) new Comparable[n];
    size = 0;
  }
  
  public void insert(T x) {
    array[size] = x;
    moveUp();
    size++;
  }
  
  private void moveUp() {
    int child = size;
    int parent = (child-1)/2;
    T temp = array[child];
    while(child > 0 && temp.compareTo(array[parent]) < 0) {
      array[child] = array[parent];
      child = parent;
      parent = (child-1)/2;
    }
    array[child]=temp;
  }
  
  public T removeMin() {
    T min=array[0];
    array[0]=array[--size];
    moveDown();
    return min;
  }
  
  public T peekMin() {
    return array[0];
  }
  
  public void copyQueue(T[] otherArray) {
    otherArray=(T[]) new Comparable[n];
    for(int i=0; i<size; i++)
      otherArray[i] = array[i];
  }
  
  private void moveDown(){
    boolean flag = false;
    T smallest = null;
    int parent = 0;
    int child = 2*parent+1;
    T temp = array[parent];
    while(child < size && !flag){
      smallest = array[child];
    if(child+1<size && array[child+1].compareTo(array[child])<0)
      smallest = array[++child];
    if(smallest.compareTo(temp) < 0){
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
