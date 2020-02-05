class Bomb{
  int x;
  int y;
  int radius;
  color bombColour= color(255,0,0);
  boolean off=false;
  boolean bombDropped=true;
  
  Player thePlayer;
  
  Bomb(int xpos,int ypos){
   x=xpos;
   y=ypos;
   radius=10;
    
  }

  void move(){
    y++;
  }
  
  void draw(){
    fill(bombColour);
    ellipse(x,y,radius,radius);
  }
  
  boolean offScreen(){
    if(y>390){
      off=true;
    }
    return off;
  }
  
  boolean collided(Player p){
    if(y+radius >=p.ypos &&
      y-radius<p.ypos+10&&
      x>=p.xpos&&
      x<=p.xpos+10){
        noLoop();
      println("GAME OVER");
      gameOver=true;
      }
      else{
        gameOver=false;
      }
     return gameOver; 
  }

  
  
}