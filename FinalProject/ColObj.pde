class ColObj {
  PVector pos; // position of bottom corner
  PVector size;
  
  
  ColObj(PVector pos, PVector size)
  {
    this.pos = pos;
    this.size = size;
    
  }
  
  void display()
  {
    circle(pos.x,pos.y, 1);
    rect(pos.x,pos.y, size.x, size.y);
  }
  
  void render()
  {
    display();
  }
  
  
  
  
  
}
