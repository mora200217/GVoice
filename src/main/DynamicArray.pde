interface DynamicArrayGen<T> {
  
  abstract public int length();
  abstract public T get(int i);
  abstract public void set(int i, T j);
  
}
public class DynamicArray<T> implements DynamicArrayGen<T> {
  private static final int N = 2;
  private T[] array;
  private int size; // Número internos  

  public DynamicArray() {
    this(N);
  }
  public DynamicArray(int N) {
    array = (T[]) new Object[N];
  }

  /**
  * 
  **/ 
  public void set(int i, T j) {
    int lenin=array.length;

    while (lenin < i) {
      lenin = 2 * lenin; 
    }
    
    if(lenin==array.length){
      array[i]=j;
    }
    else{
     T[] tempoarray = (T[]) new Object[lenin];
     for(int f=0;i<array.length;f++){
       tempoarray[f]=array[f];
     }
     array=tempoarray;
     tempoarray = null;
     println(array.length);
     array[i-1]=j;
    }
  }
  public T get(int i) {
    T elemento;
    if(array.length<i){
     elemento=array[i];
    }
    else{
      throw new RuntimeException("el elemento no existe");
    }
     return elemento ;
  }


  /**
  *
  **/ 

  public void pushBack(T element){
    this.set(this.size, element); 
    this.size++; 
  }


/**
  *
  **/ 
  public int length() {
    return array.length;
  }
}
