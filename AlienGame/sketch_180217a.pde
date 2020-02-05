 Alien myAliens[];
Bullet myBullets[];
Alien theAlien;// Declare an array of Aliens 
Player thePlayer;
Bomb theBomb;
Bullet theBullet;
boolean alienDie;
boolean gameOver=false;
ArrayList<Bullet>bullets=new ArrayList();
ArrayList<Bomb>bombs=new ArrayList();
PImage alienImage; 
PImage explodeImage;
PFont myFont;
int xpos;
int ypos;
float boom;
void setup() {
  size(400, 400);
  myFont=loadFont("Calibri-25.vlw");
  myAliens=new Alien[10];
  thePlayer= new Player(SCREENY-MARGIN-PLAYERHEIGHT);
  theBullet= new Bullet(thePlayer);
  
  alienImage= loadImage("alien.gif"); //load the images 
  explodeImage=loadImage("exploding.gif");
  init_aliens(myAliens);// initialise the array
}
void init_aliens (Alien alienArray[]) { // pass in your array, plus the image to use 
  ypos=10;
  for (int i=0; i<alienArray.length; i++) {
    alienArray[i]=new Alien((i*40), ypos, alienImage);
  }
 
}
 Bullet b;
 Bomb bb;
void draw() {
  background(0);
  for(int i=0;i<myAliens.length;i++){
    myAliens[i].draw();
    if(myAliens[i].isDead==false){
      boom=int(random(50));
      if(boom==1&&myAliens[i].bombDropped==false){
        println("ZOOM");
        bb=new Bomb(myAliens[i].xpos,myAliens[i].ypos);
        myAliens[i].bombDropped=true;
        if(bb!=null){
          bombs.add(bb);
        }
      }
    }
  }
  int alienCount=0;
  for(int i=0; i<myAliens.length;i++){
    if(myAliens[i].isDead==true){
      alienCount++;
    }
  }
  if(alienCount==10){
    textFont(myFont);
    fill(255);
    text("You Win",200,200);
    noLoop();
  }
      
 for(int count=0;count<bombs.size();count++){
   bombs.get(count).draw();
   bombs.get(count).move();
   if(bombs.get(count).collided(thePlayer)==true){
     textFont(myFont);
     fill(255);
     text("Game Over!",200,200);
     noLoop();
   }
   if(bombs.get(count).offScreen()==true){
     bombs.remove(count);
     myAliens[count].bombDropped=false;
   }
 }
 
    
  for (int i=0; i<myAliens.length; i++) {
    myAliens[i].draw();
   
  }
  

  move_alien(myAliens);
  draw_alien(myAliens);
  thePlayer.move(mouseX);
  thePlayer.draw();
 
  
 
  
  
  
  if (bullets != null)
  {
    for(int count=0; count<bullets.size();count++){
      bullets.get(count).draw();
      bullets.get(count).move();
      bullets.get(count).collide(myAliens);
    }
  }
}
   
  
  
 


void mousePressed(){
  
  println("Pressed");
  b=new Bullet(thePlayer);
  if(b !=null){
  bullets.add(new Bullet(thePlayer));
  }

}


void move_alien(Alien alienArray[]) {
  for (int i=0; i<alienArray.length; i++) 
    alienArray[i].move();
}

void draw_alien(Alien alienArray[]) {
  for (int i=0; i<alienArray.length; i++) {
    alienArray[i].draw();
    
  }

} 