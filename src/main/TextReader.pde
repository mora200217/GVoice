public class TextReader {
  private String document;
  
  public TextReader(String input) {
    this.document =  input;
    String[] lines = loadStrings(document);
    
    for (int line = 0; line < lines.length; line++) {
      String[] words = split(lines[line], " ");
      for (int word = 0; word < words.length; word++){
        println(word);
      }
    }
  }
  public String[] lines(){
    String[] lines = loadStrings(document);
    return lines;
  }
}
