/**
 * Array Dinamico ( DynamicArray )
 * 
 *  implementacion de un array dinamico con factor 2, 
 *  Consta de 1 array que puede cambiar su tamaño durante el tiempo de ejecucion. 
 */
interface DynamicArrayGen<T> {
  abstract public int length();
  abstract public T get(int i);
  abstract public void set(int i, T j);
}

public class DynamicArray<T> implements DynamicArrayGen<T> {
  private static final int N = 2;
  private T[] array;
  public DynamicArray() {
    this(N);
  }
  public DynamicArray(int N) {
    array = (T[]) new Object[N];
  }
  /**
   *  inserta un elemento en el indice dado si el indice es mayor al del array duplica el tamaño del array.
   * 
   *  @param {integer,Type} .
   *  @return{} - Éxito del proceso. 
   **/
  public void set(int index, T data) {
    int lenin=array.length;
    while (lenin<index) {
      lenin=lenin*lenin;
    }
    if(lenin==array.length){
      array[index]=data;
    }
    else{
     T[] tempoarray = (T[]) new Object[lenin];
     for(int f=0;f<array.length;f++){
       tempoarray[f]=array[f];
     }
     array=tempoarray;
     tempoarray=null;
     array[index-1]=data;
    }
  }
    /**
   *  retorna el elemento en el indice dado si el indice es mayor al del array retorna una excepción.
   *  Maneja Excepción de index maximo.
   *  @param {integer} .
   *  @return{Type} - Éxito del proceso. 
   **/
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
   *  retorna la longitud actual maxima del array.
   *  @param {} .
   *  @return{Integer} -retorna la longitud del array. 
   **/
  public int length() {
    return array.length;
  }
}
