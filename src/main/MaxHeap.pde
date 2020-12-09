class MaxHeap {

  int size; 
  Word[] words; 
  MaxHeap() {
    this.size = 0; 
    this.words = new Word[100];
  }

  public void insertItem(Word w) {
    this.insertItem(w.data, w.weight);
  }

  public Word getMax() {
    return words[0];
  }
  public void insertItem(String s, int i) {
    // println("Agregando: " + s); 
    words[this.size] = new Word(s, i);
    moveUp(); 
    this.size++;
  }

  private void moveUp() {
    int child = this.size; 
    int parent = (this.size - 1)/2;
    Word temp = this.words[child];
    while (child > 0 && temp.compareTo(words[parent]) > 0) {
      words[child] = words[parent]; 
      child = parent; 
      parent = (child - 1) / 2;
    }
    words[child] = temp;
  }

  private void moveDown() {
    boolean flag = false;
    Word smallest = new Word(" ", -1);
    int parent = 0;
    int child = parent * 2 + 1;
    Word temp = words[parent]; 

    while (child < size && !flag) {
      smallest = words[child];

      if (child + 1 < size && words[child+1].compareTo(words[child]) > 0)
        smallest = words[++child];
      if (smallest.compareTo(temp) > 0) {
        words[parent] = smallest; 
        parent = child;
      } else 
      flag = true; 
      child = 2* parent + 1;
    }
    words[parent] = temp;
  }

  public void printAll() {
    for (int i = 0; i< this.size; i++) {
      println(this.words[i].data);
    }
  }

  public Word removeMax() {
    Word max = words[0]; 
    words[0]=words[--size];
    moveDown(); 
    return max;
  }
}
