final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;

 int count;
 int explodeCount;
//Bullet theBullet;

class Alien {
  int xpos;
  int ypos;
  int change;
  int direction;
  boolean explode;
  boolean exploded;
  float boom;
  boolean bombDropped;
  boolean isDead;

  Alien( int x, int y, PImage img) {  
    xpos=x;
    ypos=y;
    change=1;
    direction=A_FORWARD;
    explode=false;
    exploded=false;
    bombDropped=false;
    isDead=false;
    alienDie=false;
    alienImage= img;
    explodeCount=0;
  }
 
  void move() {
    if(exploded){
    }
    if (direction==A_FORWARD) {
      xpos++;
      if (xpos++>350) {
        direction=A_DOWN;
        count=0;
      }
    }
    if (direction==A_DOWN) {
        count++;
        ypos++;
        if (count>20) {
          if(xpos>350){
            direction=A_BACKWARD;
          }
          else if(xpos<10){
            direction=A_FORWARD;
          }
        }
      }
    
    if (direction==A_BACKWARD) {
      xpos--;
      if (xpos--<10) {
        direction=A_DOWN;
        count=0;
      }
    }
  }
  

  
  void exploding() {
      println("BOOM");
      explode=true;
      alienDie=true;
      isDead=true;
  }


  void draw() {
    if(exploded){
      
    }
    else if(explode){
      
      image(explodeImage, xpos, ypos);
      explodeCount++;
      if(explodeCount>50){
        exploded=true;
        explode=false;
      }
      
    }
    else{
        image(alienImage, xpos, ypos);
    }
  }
}