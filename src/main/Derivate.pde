float[] getInterval (float point,int radio,Polinomio pol){
  float[] lista_y;
  float xpoint = point - radio;
  lista_y = new float[(2*radio)-1];
  for(int i = 0; i<2*radio; i++){
      lista_y[i] = pol.getY(xpoint);
      xpoint += i;
  }
  return lista_y;
}

Polinomio derivate(Polinomio pol){
  return pol.derivate();
}
  
RefQueue<PVector> getPC(Polinomio pol, GraphController graph){
  Heap h;
  Polinomio deripol = pol.derivate();
  h = new Heap(deripol,graph);
  PVector aux = new PVector();
  float[] points = deripol.getPoints(graph);
  for(int i = 0;i < points.length;i++){
    aux.x = i-(graph.getDimension().x)/2;
    aux.y = abs(deripol.getY(aux.x));
    System.out.printf("Points: %.2f    ",points[i]);
    System.out.printf("aux.x: %.2f, aux.y: %.2f\n",aux.x,aux.y);
    h.insertItem(new PVector(i-(graph.getDimension().x)/2,abs(deripol.getY(aux.x))));
  }
  
  RefQueue<PVector> min;
  PVector aux2;
  min = new RefQueue<PVector>();
  //for(int g = 0; g < 20;g++){
  //  aux2 = h.removeMin();
  //  System.out.printf("removeMin ... aux.x: %.2f, aux.y: %.2f\n",aux2.x,aux2.y);
  //}
  
  aux2 = h.removeMin();
  while((aux2.y - 0) <= 0.4){
    min.enqueue(aux2);
    System.out.printf("removeMin ... aux.x: %.2f, aux.y: %.2f\n",aux2.x,aux2.y);
    aux2 = h.removeMin();
  }
  int cant = min.numInside();
  System.out.printf("%d",cant);
  
  return min;
}
