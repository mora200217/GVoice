public class Elipse {
  //Declaración de variables funcionales tanto para la elipse como para el círculo 
  private float pos_x = 0;
  private float pos_y = 0;
  private float radio_may = 1;
  private float radio_men = 1;

  //Constructor para el círculo 

  public Elipse(float x, float y, float radio) {
    this.pos_x = x;
    this.pos_y = y;
    this.radio_may = radio;
    this.radio_men = radio_may;
  }

  //Constructor para la elipse

  public Elipse(float x, float y, float may, float men) {
    this.pos_x = x;
    this.pos_y = y;
    this.radio_may = may;
    this.radio_men = men;
  }

  //Retorna dos valores de y para cada x

  public float[] f (float x) {
    //variables
    float []f = new float[2];
    f[0] = 0;
    f[1] = 0;
    f[0] = (sqrt(pow(radio_may, 2)*pow(radio_men, 2)-pow(radio_men, 2)*pow(x-pos_x, 2)))+pos_y;
    f[1] = -(sqrt(pow(radio_may, 2)-pow(x-pos_x, 2)))+pos_y;

    return f;
  }
}
