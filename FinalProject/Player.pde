class Player{

  PVector position;
  PVector vel;

  Player(PVector pos)
  {
    position = pos;
    vel = new PVector(0,0);
  }
  
  
  
  
  
  void move_and_slide()
  {
    PVector.add(position, vel, position);
    println(vel);
  }
  
  void display()
  {
    circle(position.x,position.y, 10);
  }
  
  void render()
  {
    move_and_slide();
    display();
  }

}
