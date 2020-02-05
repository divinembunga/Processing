class Bullet{
  int x;
  int y;
  float dx;
  int radius;
  color bulletColour= color(255);
  Player thePlayer;
  
  Bullet(Player p){
    x=p.xpos;
    y=p.ypos;
    radius=5;
    
  }

  void move(){
    y=y-5;
    y--;
  }
  
  void draw(){
    fill(bulletColour);
    ellipse(x,y,radius,radius);
  }
  Alien a;
  void collide(Alien[] myAliens){
   for (int i=0; i<myAliens.length; i++) {
      if(y+radius >=myAliens[i].ypos &&
      y-radius<myAliens[i].ypos+10&&
      x>=myAliens[i].xpos&&
      x<=myAliens[i].xpos+10){
      println("collided");
      myAliens[i].exploding();
      }
    }
  }
    
  
  
}