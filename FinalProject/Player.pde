class Player{
  
  color redBright = color(215, 30, 34); 
  color redShadow = color(122, 8, 56);
  color visorLight = color(150,202,221);
  color visorDark = color(73,99,109);
  
  //Above are colors of the red among us, replace the pixels in the image with these
  
  PVector position; // Position of bottom left corner of shadow
  PVector vel; // velocity of shadow
  
  int frameCount = 0; // variable storing what frame of the walk animation to play
  
  boolean flip; // bool storing whether to flip the image or not
  PImage idle; // idle image
  PImage[] walk; // all frames of walking animation
  
  int[] walkPosX = {14,9,9,9,12,13,18,11,18,8,14,18}; //X offset for walking animation to allign position to the shadow
  int[] walkPosY = {1,1,1,3,2,2,2,1,5,2,2,2};// same but y offset
  
  
  
  PImage idleF; // flipped idle animation
  PImage[] walkF; // flipped frames of walk animation
  
  PVector size; // size of collision 
  
  

  Player(PVector pos)
  {
    position = pos;
    vel = new PVector(0,0);
    idle = loadImage("AmongUsSprites/idle.png");
    idleF = flip(idle);
    
    walk = new PImage[12];
    walkF = new PImage[12];
    
    for (int i = 0; i < 9; i++)
    {
      walk[i] = loadImage("AmongUsSprites/Walk000" + (i + 1) + ".png");
      println(walk[i].width);
    }
    
    for (int i = 10; i < 13; i++)
    {
      walk[i - 1] = loadImage("AmongUsSprites/Walk00" + i + ".png");
      println(walk[i - 1].width);
    }
    
    for (int i = 0; i < 12; i++)
    {
      walkF[i] = flip(walk[i]);
    }
      
    size = new PVector(45, 12);
    
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
    }
    
    return flippedImg;
    
  }

  
  
  void move_and_slide() //moves the player according to velocity, also will maybe handle collision
  {
    PVector.add(position, vel, position);
    //println(vel);
  }
  
  void display() // displays the player sprite
  {
    circle(position.x,position.y, 1);
    rect(position.x,position.y, size.x, -size.y);
   
    if (vel.x != 0 || vel.y != 0)
    {
      frameCount++;
      int currentIndex = (frameCount / 5) % 12;
      PImage currentWalk = (flip? walkF: walk)[currentIndex];
      image(currentWalk, position.x + (flip? -currentWalk.width + 135 + walkPosX[currentIndex]:-walkPosX[currentIndex]) / 3.0,position.y + walkPosY[currentIndex] / 3.0, currentWalk.width / 3.0, -1 * currentWalk.height / 3.0);
    }
    else
    {
      image((flip? idleF: idle), position.x + (flip? -7 :-23) / 3.0,position.y + 4 / 3.0, idle.width / 3, -1 * idle.height / 3);
    }
    
  }
  
  void render()
  {
    move_and_slide();
    display();
  }

}
