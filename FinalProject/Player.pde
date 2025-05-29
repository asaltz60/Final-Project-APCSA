class Player{
  
  color redBright = color(215, 30, 34);
  color redShadow = color(122, 8, 56);
  color visorLight = color(150,202,221);
  color visorDark = color(73,99,109);
  
  PVector position;
  PVector vel;
  
  boolean flip;
  PImage idle;
  PImage[] walk;
  
  
  PImage idleF;
  
  

  Player(PVector pos)
  {
    position = pos;
    vel = new PVector(0,0);
    idle = loadImage("AmongUsSprites/idle.png");
    idleF = flip(idle);
    
    walk = new PImage[12];
    
    for (int i = 0; i < 9; i++)
    {
      walk[i] = loadImage("AmongUsSprites/Walk000" + (i + 1));
    }
      
    
  }
  
  PImage flip(PImage img)
  {
    img.loadPixels();
    color[] img_array = img.pixels;
    PImage flippedImg = createImage(img.width, img.height, ARGB);
    
    for (int i = 0; i < img_array.length; i++)
    {
      if (img.pixels[i - 2 * (i % img.width) + img.width - 1] != 0)
      {
        flippedImg.pixels[i] = img.pixels[i - 2 * (i % img.width) + img.width - 1];
      }
      println(img.pixels[i - 2 * (i % img.width) + img.width - 1]);
    }
    
    print(img_array);
    return flippedImg;
    
  }

  
  
  void move_and_slide() //moves the player according to velocity, also will maybe handle collision
  {
    PVector.add(position, vel, position);
    //println(vel);
  }
  
  void display() // displays the player sprite
  {
    if (flip)
    {
      image(idleF, position.x,position.y, -1 * idle.width / 3,  idle.height / 3);
    }
    else
    {
      image(idle, position.x,position.y, -1 * idle.width / 3,  idle.height / 3);
    }
}
  
  void render()
  {
    move_and_slide();
    display();
  }

}
