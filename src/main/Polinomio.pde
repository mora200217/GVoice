/**
 * Polinomio ( Polinomio )
 * implementacion para obtener los puntos de un polinomio
 */
public class Polinomio implements Element {
  private float[] coef;
  private int grado;
  private float delta=0;
  public PVector pos=new PVector(0, 0);
  public Polinomio(int gradot) {
    grado=gradot;
    this.delta=1;
    this.pos=new PVector(0, 0);
    if (grado < 0) {

      //Evita errores al incluir exponentes menores a 0
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
    this.delta=1;
    if (grado < 0)
      throw new RuntimeException("el grado ingresado no es valido");
    else {
      if (coeft.length-1!=grado)
        throw new RuntimeException("el numero de indices debe concidir con el grado");
    }
    coef = new float[grado+1];
    for (int i = 0; i <= grado; i++) {
      coef[i] = coeft[i];
    }
  }
  /**
   *  Retorna el valor de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float} el punto de Y para el X dado. 
   **/
  public float y(float x) {
    float valor = 0;
    for (int i =0; i<=grado; i++) {
      valor+=(coef[i]*pow(x, i));
      //println(valor);
    }
    return valor;
  }
  /**
   *  Retorna los puntos de y para el eje coordenado.
   *  
   *  @param {GraphController} sistema grafico donde se va a evaluar.
   *  @return{Float[]} los puntos de Y para el sistema grafico. 
   **/
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float zoom=h.getZoom();
    float[]points= new float [ceil(size/this.delta)];
    for (float i=0; i<size; i+=delta) {
      points[int(i/delta)]=this.y((i-(size/2))/zoom);
    }
    return points;
  }
  /**
   *  Retorna el grado del polinomio.
   *  @param {} .
   *  @return{int} el grado del polinomio. 
   **/
  public int grado() {
    return this.grado;
  }
    /**
   *  Retorna el delta evaluado.
   *  
   *  @param {} .
   *  @return{Float} retorna delta. 
   **/
  public float getDelta() {
    return delta;
  }
    /**
   *  permite la suma de un polinimo menor o igual al actual.
   *  
   *  @param {Polinimio} .
   *  @return{} -exito del proceso. 
   **/
  public void suma(Polinomio b) {
    Polinomio a = this;
    if (a.grado <= b.grado) {
      throw new RuntimeException("se le debe sumar al mayor el menor");
    }
    for (int i = 0; i <= b.grado; i++) {
      a.coef[i] += b.coef[i];
    }
  }
}
