boolean up;
boolean down;
boolean left;
boolean right;




Player thePlayer;
void setup()
{
  frameRate(120);
  size(1000,800);
  thePlayer = new Player(new PVector(0,0));
}


void keyPressed() {
    switch (keyCode){
      case UP:
        up = true;
        break;
      case DOWN:
        down = true;
        break;
      case LEFT:
        left = true;
        break;
      case RIGHT:
        right = true;
        break;
        
    }
  }
  
  void keyReleased()
  {
    switch (keyCode){
      case UP: 
        up = false;
        break;
      case DOWN:
        down = false;
        break;
      case LEFT:
        left = false;
        break;
      case RIGHT:
        right = false;
        break;
    }
    println(keyCode);
  }
  
  void playerMove()
  {
    if (up)
    {
      thePlayer.vel.y = -5;
    }
    if (down)
    {
      thePlayer.vel.y = 5;
    }
    if (left)
    {
      thePlayer.vel.x = -5;
    }
    if (right)
    {
      thePlayer.vel.x = 5;
    }
  }

  
void draw()
{
  background(173, 216, 230);
  playerMove();
  thePlayer.render();
}
  
