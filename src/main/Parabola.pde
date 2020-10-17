/**
 * Parabola ( Parabola )
 * implementacion para obtener los puntos de una Parabola
 */
public class Parabola {
  private float[] vertice = new float[2];
  private float[] foco = new float[2];
  private float[] coeficientes = new float[3];
  private char variable;

  //Constructor sin argumentos de entrada, grafica x^2+2x+1
  public Parabola() {
    coeficientes[0] = 1;
    coeficientes[1] = 2;
    coeficientes[2] = 1;
    variable = 'x';
    foco[1] = 1/(4*coeficientes[0]);
    vertice[0] = -coeficientes[1]*2*foco[1];
    vertice[1] = coeficientes[2]-(pow(vertice[0], 2)/(4*foco[1]));
    foco[0] = vertice[0];
  }

  //Constructor con argumentos de entrada de vertice y foco
  public Parabola(float[] ver, float[] foc) {
    if (foc[0] == ver[0] && foc[1] == ver[1]) {
      throw new RuntimeException("Los datos ingresados no son validos");
    }
    foco[0] = foc[0];
    foco[1] = foc[1];
    vertice[0] = ver[0];
    vertice[1] = ver[1];
    if (foco[0] == ver[0] && foco[1] != ver[1]) {
      variable = 'x';
    } else if (foco[0] != ver[0] && foco[1] == ver[1]) {
      variable = 'y';
    }
  }

  //Constructor con argumentos de entrada de coeficientes del polinomio y la variable a tratar
  public Parabola(float[] coef, char var) {
    coeficientes[0] = coef[0];
    coeficientes[1] = coef[1];
    coeficientes[2] = coef[2];
    variable = var;
    if (variable == 'x') {
      foco[1] = 1/(4*coeficientes[0]);
      vertice[0] = -coeficientes[1]*2*foco[1];
      vertice[1] = coeficientes[2]-(pow(vertice[0], 2)/(4*foco[1]));
      foco[0] = vertice[0];
    } else if (variable == 'y') {
      foco[0] = 1/(4*coeficientes[0]);
      vertice[1] = -coeficientes[1]*2*foco[0];
      vertice[0] = coeficientes[2]-(pow(vertice[1], 2)/(4*foco[0]));
      foco[1] = vertice[1];
    }
  }
  /**
   *  Retorna dos valores de y para cada x.
   *  
   *  @param {Float} X a evaluar.
   *  @return{Float} el punto Y para el X dado. 
   **/
  public float dep(float ind) {
    float valor = 0;
    if (variable == 'x') {
      valor = (pow(ind-vertice[0], 2)/(4*foco[1]))+vertice[1];
    } else if (variable == 'y') {
      valor = (pow(ind-vertice[1], 2)/(4*foco[0]))+vertice[0];
    }
    return valor;
  }
}
