public class Word {
    String data; 
    int weight;
    Word(String s, int w) {
      this.data = s; 
      this.weight = w;
    }
    Word(String s) {
      this(s, 1);
    }

    public int compareTo(Word w) {
      return (this.weight - w.weight);
    }
  }
