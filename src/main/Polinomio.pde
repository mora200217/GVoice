//implementacion de la base para manejar polinomios.
public class Polinomio implements Element {
  private float[] coef;
  private int grado;
  private float [] dupla;
  public float delta=0;
  public PVector pos=new PVector(0,0);
  public Polinomio(int gradot) {
    grado=gradot;
    this.delta=1;
    this.pos=new PVector(0, 0);
    if (grado < 0) {

      //por si se ponen de mamones con grados negativos.
      throw new RuntimeException("el grado ingresado no es valido");
    } else {
      coef = new float[grado+1];
      //genero un array almacenando los coeficientes que como no pasaron van a ser 0.
      for (int i = 0; i <= grado; i++) {
        coef[i] =0.3;
      }
    }
  }
  public Polinomio(float[] coeft, int gradot) {
    grado=gradot;
    if (grado < 0)
      throw new RuntimeException("el grado ingresado no es valido");
    else {
      if (coeft.length-1!=grado)
        throw new RuntimeException("el numero de indices debe concidir con el grado");
    }
    coef = new float[grado+1];
    for (int i = 0; i <= grado-1; i++) {
      coef[i] = coeft[i];
    }
  }
  //saca el valor en determinado X.
  public float y(float x) {
    float valor = 0;
    for (int i =0; i<=grado; i++) {
      valor+=(coef[i]*pow(x, i));
      //println(valor);
    }
    return valor;
  }
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float[]points= new float [ceil(size/this.delta)];
    for(float i=0;i<size;i+=delta){
      points[int(i/delta)]=this.y(i-size/2);
    }
    return points;
  }
  //retorna el grado del polinomio necesario para realizar la suma correctamente.
  public int grado() {
    return this.grado;
  }
  public float getDelta(){
    return delta;
  }
  
  //permite la suma de polinomios en caso que se quiera hacer una traslacion recordar que siempre al de mayor grado se le suma el menor.
  public void suma(Polinomio b) {
    Polinomio a = this;
    if (a.grado < b.grado) {
      throw new RuntimeException("se le debe sumar al mayor el menor");
    }
    for (int i = 0; i <= b.grado; i++) {
      a.coef[i] += b.coef[i];
    }
  }
}
