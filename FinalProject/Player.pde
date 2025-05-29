class Player{
  
  color redBright = color(215, 30, 34);
  color redShadow = color(122, 8, 56);
  color visorLight = color(150,202,221);
  color visorDark = color(73,99,109);
  
  PVector position;
  PVector vel;
  
  PImage idle;
  
  

  Player(PVector pos)
  {
    position = pos;
    vel = new PVector(0,0);
    idle = loadImage("AmongUsSprites/idle.png");
  }
  

  
  
  void move_and_slide()
  {
    PVector.add(position, vel, position);
    println(vel);
  }
  
  void display()
  {
    scale(-1,1);
    image(idle, position.x,position.y, -1 * idle.width / 3,  idle.height / 3);
    scale(1,1);
  }
  
  void render()
  {
    move_and_slide();
    display();
  }

}
