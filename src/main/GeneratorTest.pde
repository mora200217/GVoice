class GeneratorTest {
  protected class Record {
    private int time; 
    private int size;  
    Record(int time) {
      this.time = time;
      this.size = 0;
    }
  }


  private long countTime, countSize; 
  private LinkedList<Record> data; 
  private boolean hasSentRecord = false; 
  
  GeneratorTest() {
    println("Iniciando generador de prueba");
    data = new LinkedList<Record>();
  }

  public void beginSample() {
    this.countTime = System.nanoTime();
    this.countSize = System.nanoTime();
  }

  public void endSample() {
    this.step(System.nanoTime() - this.countTime);
  }

  private void step(long time) {
    println(time / 1000000);
    data.pushRear(new Record((int) time / 1000000));
  }


  private void step() {
    long timet = System.nanoTime();
    long time = timet - countTime; 
    countTime = timet; 
    data.pushRear(new Record((int) time / 1000000));
  }

  public void createReport(String type) {
    switch(type) {
      // ---------------------------
    case "txt": 
      PrintWriter output; 
      output = createWriter("prueba.txt");
      output.println("C" + " " + "T");

      Node<Record> dataList[] = data.getNodesList(); 

      int total = 0; 
      for (int i = 0; i < dataList.length; i++ ) {
        println("VALOR _ " + dataList[i].value.time); 
        output.println(i + " "  + dataList[i].value.time);
        total += dataList[i].value.time; 
      }
        
      output.println("TOTAL: " + total); 
      output.close();

      break; 
      // ---------------------------
    case "csv":

      break;
    }
  }
}
