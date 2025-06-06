class DialogueObj
{
  String text; //the text to be displayed
  String displayText; //the text currently displayed
  String character; //the character saying the text
  int progress; //how many characters of the text are shown
  ArrayList<PImage> imageList; //list of dialogue sprites
  
  boolean talking;// if text is currently being added to the display (maybe just use text.length and displayText.length()?)
  int frameCount = 0;
  
  DialogueObj(String character, String text)
  {
    this.text = text;
    this.character = character;
    progress = 0;
    imageList = new ArrayList<PImage>();
    if (character.equals("Amogus")){
      for (int i = 1; i <= 5; i++)
      {
        imageList.add(loadImage("AmongUsDialougeSprites/AmongUs" + i + ".png"));
      }
    }
  }
  
  void display()
  {
    frameCount++;
    int currentIndex = (frameCount / 10) % 5;
   // print(currentIndex);
    
    rect(50, height - 250, width - 100, 200);
    fill(0,0,0);
    text(character, 75, height - 200);
    image(imageList.get(currentIndex), 55, height - 245);
    fill(255,255,255);
  }
  
  void render()
  {
    display();
  }
  
  
  
  
  
  
  
  
}
