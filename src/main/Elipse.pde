/**
 * Elipse ( Elipse )
 * implementacion para obtener los puntos de una ellipse
 */
public class Elipse implements Element{
  //Declaración de variables funcionales tanto para la elipse como para el círculo 
  PVector centroide = new PVector(0, 0);
  private float radio_may = 1;
  private float radio_men = 1;
  private float delta=0;
  private boolean isNull = false; 
  public int control=0;
  //Constructor para el círculo 
  public Elipse(float x, float y, float radio) {
    this.delta=1;
    this.centroide.x = x;
    this.centroide.y = y;
    this.radio_may = radio;
    this.radio_men = radio_may;
  }
  //Constructor para la elipse
  public Elipse(float x, float y, float may, float men) {
    this.delta=1;
    this.centroide.x = x;
    this.centroide.y = y;
    this.radio_may = may;
    this.radio_men = men;
  }

  public color getColor() {
    return color(2, 4, 5);
  }
  /**
   *  Retorna dos valores de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float[]} los dos puntos de Y para el X dado. 
   **/
  public float[] f (float x) {
    //variables
    float []f = new float[2];
    f[0] = 0;
    f[1] = 0; 
    f[0] = sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;
    f[1] = -sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;

    return f;
  }
  /**
   *  Retorna los puntos de y para el eje coordenado al pedirlo la primera vez retorna los positivos la segunda los negativos.
   *  
   *  @param {GraphController} sistema grafico donde se va a evaluar.
   *  @return{Float[]} los dos puntos de Y para el sistema grafico. 
   **/
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float[]points= new float [ceil(size/this.delta)];
    for (float i=0; i<size; i+=delta) {
      points[int(i/delta)]=this.f(i-size/2)[control];
    }
    if (control==0) {
      control=1;
    } else {
      control=0;
    }
    return points;
  }

  public void nullify() {
    this.isNull = true;
  }

  public boolean isNull() {
    return this.isNull;
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
}
