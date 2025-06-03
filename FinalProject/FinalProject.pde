boolean up;
boolean down;
boolean left;
boolean right;

boolean recentDown;
boolean recentRight;

ArrayList<ColObj> ColList;


Player thePlayer;
void setup()
{
  frameRate(120);
  size(1000,800);
  thePlayer = new Player(new PVector(0,0));
  ColList = new ArrayList<ColObj>();
  
  ColList.add(new ColObj(new PVector(101,200),new PVector(100,100)));
  
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
        thePlayer.flip = true;
        break;
      case RIGHT:
        right = true;
        recentRight = true;
        thePlayer.flip = false;
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
  
  void colDetector(Player p, ColObj obj)
  {
    if (p.position.x + p.size.x >= obj.pos.x && p.position.x <= obj.pos.x + obj.size.x && 
    p.position.y - p.size.y <= obj.pos.y && p.position.y >= obj.pos.y - obj.size.y)
    {
      if (p.position.x + p.size.x >= obj.pos.x && p.position.x <= obj.pos.x + obj.size.x)
      {
        background(255, 50,50);
        if (p.position.x < obj.pos.x)
        {
          println("Left");
          p.position.x = obj.pos.x - p.size.x;
          p.vel.x = min(p.vel.x,0);
        }
        else if (p.position.x + p.size.x > obj.pos.x + obj.size.x)
        {
          println("Right");
          p.position.x = obj.pos.x + obj.size.x;
          p.vel.x = max(p.vel.x,0);
        }
      }
      if (p.position.y - p.size.y <= obj.pos.y && p.position.y >= obj.pos.y - obj.size.y)
      {
        if (p.position.y > obj.pos.y)
        {
          println("Down");
          p.position.y = obj.pos.y + p.size.y;
          p.vel.y = max(p.vel.y,0);
        }
        else if (p.position.y - p.size.y < obj.pos.y - obj.size.y)
        {
          println("Up");
        }
      }
    }
  }
    

  
void draw()
{
  background(173, 216, 230);
  playerMove();
  
  for (ColObj obj : ColList)
  {
    colDetector(thePlayer, obj);
    obj.render();
  }
  
  thePlayer.render();
}
  
