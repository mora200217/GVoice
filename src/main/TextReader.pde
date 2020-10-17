/**
 * TextReader
 * 
 *  Clase que toma un archivo txt 
 *  Devuelve una cola con las palabras del mismo
 *  Permanece en etapa de desarrollo
 *
 */

public class TextReader {
  private String document;
  public RefQueue< String > instructions = new RefQueue(); 
  public TextReader(String input) {
    this.document =  input;
    String[] lines = loadStrings(document);
    for (int line = 0; line < lines.length; line++) {
      String[] words = split(lines[line], " ");

      for (int index = 0; index < words.length; index++) {
        this.instructions.enqueue(words[index]);
      }
    }
  }
  public RefQueue readThis(){
    
    return instructions;
  }
}
