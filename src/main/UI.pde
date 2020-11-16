
class UI{
  UIBar bar; 
  PVector maxDim;  
  UI(float w, float h, GraphController g){
    this.maxDim = new PVector(w, h); 
    bar = new UIBar(this.maxDim.x, this.maxDim.y, g);     
  }
  
  void toggleButtons(){
    
  }
  
  void toggleText(){
    
  }
  
  void show(){
     bar.show();  
  }
  
}
