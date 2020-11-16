class Test2 {
  private int n; 
  private RefQueue<Polinomio> polinomios; 
  Test2() {
    this(20);
  }

  Test2(int n) {
    this.n = n;
    this.polinomios = new RefQueue(); 
  }


  RefQueue createSamples() {
    
    for (int i = 0; i < this.n; i++ ) {
      int coeff = floor(random(2, 8)); 
      float[] coeffValues = new float[coeff +1];  
      for (int j = 0; j < coeff + 1; j++) {
        coeffValues[j] = random(0, 3) / 100; // v:  
      }
      Polinomio p = new Polinomio(coeffValues, coeff);
      polinomios.enqueue(p); 
    }
    return polinomios; 
  }
}
