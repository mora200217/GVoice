public class Elipse implements Element{
  //Declaración de variables funcionales tanto para la elipse como para el círculo 
  PVector centroide = new PVector(0, 0);
  private float radio_may = 1;
  private float radio_men = 1;
  public float delta=0;
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

  //Retorna dos valores de y para cada x
  //Al despejar y de la fórmula de la elipse tenemos:  
  //sqrt(((pow(radio_may,2)*pow(radio_men,2)-pow(radio_men,2)*pow((x-centroide.x),2))/pow(radio_may,2)))+centroide.y 
  //Esta misma se puede utilizar para la circunferencia, ya que la diferencia sólo radica en que para la elipse el radio_may y radio_men son diferentes 

  public float[] f (float x) {
    //variables
    float []f = new float[2];
    f[0] = 0;
    f[1] = 0; 
    f[0] = sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;
    f[1] = -sqrt(((pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow((x-centroide.x), 2))/pow(radio_may, 2)))+centroide.y;

    return f;
  }
  public float[] getPoints(GraphController h) {
    //
    float size=h.getDimension().x;
    float[]points= new float [ceil(size/this.delta)];
    for (float i=0; i<size; i+=delta) {
      points[int(i/delta)]=this.f(i-size/2)[control];
    }
    if (control==0){
      control=1;
    }
    else{
      control=0;
    }
    return points;
  }
  public float getDelta(){
    return delta;
  }
}
