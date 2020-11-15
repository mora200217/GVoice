
class UI{
  UIBar bar; 
  PVector maxDim;  
  UI(float w, float h){
    this.maxDim = new PVector(w, h); 
    bar = new UIBar(this.maxDim.x, this.maxDim.y);     
  }
  
  void toggleButtons(){
    
  }
  
  void toggleText(){
    
  }
  
  void show(){
     bar.show();  
  }
  
}
