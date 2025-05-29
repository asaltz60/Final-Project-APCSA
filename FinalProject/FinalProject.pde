boolean up;
boolean down;
boolean left;
boolean right;

boolean recentDown;
boolean recentRight;


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
        recentDown = false;
        break;
      case DOWN:
        down = true;
        recentDown = true;
        break;
      case LEFT:
        left = true;
        recentRight = false;
        break;
      case RIGHT:
        right = true;
        recentRight = true;
        break;
        
    }
  }
  
  void keyReleased()
  {
    switch (keyCode){
      case UP: 
        up = false;
        recentDown = down;
        break;
      case DOWN:
        down = false;
        recentDown = false;
        break;
      case LEFT:
        left = false;
        recentRight = right;
        break;
      case RIGHT:
        right = false;
        recentRight = false;
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
    if (recentDown)
    {
      thePlayer.vel.y = 5;
    }
    if (! (up || recentDown))
    {
      thePlayer.vel.y = 0;
    }
    if (left)
    {
      thePlayer.vel.x = -5;
    }
    if (recentRight)
    {
      thePlayer.vel.x = 5;
    }
    if (! (left || recentRight))
    {
      thePlayer.vel.x = 0;
    }
  }

  
void draw()
{
  background(173, 216, 230);
  playerMove();
  thePlayer.render();
}
  
