interface Element{
    abstract public float[] getPoints(GraphController h);
    abstract public float getDelta();
    
    abstract public void nullify();
    abstract public boolean isNull();
    
    abstract public color getColor();  
   }
