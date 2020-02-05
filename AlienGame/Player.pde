class Player{
  int xpos; int ypos;
  color playerColour=color(255);
  Alien myAliens[];
  Alien theAlien;
  
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
   
  }
  
  void move(int x){
    if(x>SCREENX-PLAYERWIDTH)xpos=SCREENX-PLAYERWIDTH;
    else xpos=x;
  }
  
  void draw(){
    rectMode(CENTER);
    fill(playerColour);
    rect(xpos,ypos,PLAYERWIDTH,PLAYERHEIGHT);
    
  }
}