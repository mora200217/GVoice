class HeapSet {
  MaxHeap[] heaps = new MaxHeap[2];
  MaxHeap defaultHeap; 
  int count, total; 
  HeapSet() {
    this.count = 0; 
    this.heaps[0] = new MaxHeap();
    this.heaps[1] = new MaxHeap();
  }

  Word get() {
    count++; 
    Word w = this.heaps[0].removeMax();
    if (this.heaps[0].size <= 0 && count < total)
      this.change(); 
    
    return w;
  }
  
  void reset(){
   this.count = 0;  
  }

  void change() {
    MaxHeap temp = this.heaps[0];
    this.heaps[0] = this.heaps[1];
    this.heaps[1] = temp;
  }
  void update() {
    if (this.heaps[0].getMax().compareTo(this.heaps[1].getMax()) < 0) {
      this.change();
    }
  }

  void add(Word w) {
    this.add(w.data, w.weight);
  }

  void addToSecond(Word w) {
    this.addToSecond(w.data, w.weight);
  }

  void add(String s, int i) {
    this.heaps[0].insertItem(new Word(s, i));
    total++;
  }

  void addToSecond(String s, int i) {
    this.heaps[1].insertItem(new Word(s, i));
    total++;
  }

  int size() {
    return this.heaps[0].size;
  }
}
