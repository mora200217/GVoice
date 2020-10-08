
String APP_NAME = "GVoice";  
// -----------------------------------------
void setup() {

  size(700, 500);
  surface.setTitle(APP_NAME);
  background(255);
  Queue<Integer> h=new Queue(100000000);
  for (int i=0; i<100000000; i++) {
    h.enQueue(i);
  }
  while (!h.empty()) {
    try {
      h.deQueue();
    } 
    catch (Exception e) {
      System.out.println(e);
    }
  }
  println("fin");
}

// -----------------------------------------
void draw() {
  fill(255); 
  ellipse(50, 50, 10, 10);
}
