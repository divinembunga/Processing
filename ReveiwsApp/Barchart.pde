class Barchart
{
  int x;
  int y;
  int width;
  int height;
  int[] data;
  String title;
  boolean isReviewBarchart;
  Review businessPassed;
  int funny;
  int useful;
  int cool;
  color[] colors = {color(230, 25, 75), color(60, 180, 75), color(255, 225, 25), color(0, 130, 200), color(245, 130, 48)};
  //String for names, possibly comma seperated to easily lable
  int barchartMultiplier;
  Barchart(int x, int y, int width,int height, int[] data, String title){
    this.x=x;
    this.y=y;
    this.width = width;
    this.height=height;
    this.data=data;
    this.title = title;
    isReviewBarchart=false;
  }
  Barchart(int x, int y, Review businessPassed)
  {
    this.x =x;
    this.y =y;
    this.businessPassed = businessPassed;
    this.funny = businessPassed.getFunny();
    this.useful = businessPassed.getUseful();
    this.cool = businessPassed.getCool();
    this.barchartMultiplier = BARCHART_SIZE/100;
    isReviewBarchart=true;
  }

  void draw()
  {
    if(isReviewBarchart){
    //Stephen - changed alot of this still needs to be fixed
    line(x, y, x, y + BARCHART_SIZE);
    line(x, y+BARCHART_SIZE, x+BARCHART_SIZE, y+BARCHART_SIZE);
    fill(WATERMELON);
    rect(x +5*barchartMultiplier, y+BARCHART_SIZE - useful*10*barchartMultiplier, 25*barchartMultiplier, useful*10*barchartMultiplier);  
    fill(0);
    text("Useful", x + 15*barchartMultiplier, y+BARCHART_SIZE+20);
    fill(WATERMELON);
    rect(x +35*barchartMultiplier, y+BARCHART_SIZE - funny*10*barchartMultiplier, 25*barchartMultiplier, funny*10*barchartMultiplier);  
    fill(0);
    text("Funny", x + 45*barchartMultiplier, y+BARCHART_SIZE+20);
    fill(WATERMELON);
    rect(x + 60*barchartMultiplier, y+BARCHART_SIZE - cool*10*barchartMultiplier, 25*barchartMultiplier, cool*10*barchartMultiplier);  
    fill(0);
    text("Cool", x + 70*barchartMultiplier, y+BARCHART_SIZE+20);
     
     for(int i = 0; i <= 100; i +=10)
     {
       text(str(i), x-20, y + BARCHART_SIZE - i*barchartMultiplier);
     }
    }
    else{
      fill(255);
      noStroke();
      //rect(x,y,this.width,this.height);
      /*
      stroke(0);
      strokeWeight(2);
      line(x-1,y,x-1,(y+this.height));
      line(x,(y+this.height)+1, x+this.width, (y+this.height)+1);
      */
      strokeWeight(1);
      fill(0);
      textSize(15);
      text(title, x+15, y-30);
      noStroke();
      for(int i=0;i<data.length;i++){
        float rectWidth = this.width/ data.length;
        float ypos = this.y + this.height - (data[i])*2;
        fill(colors[i]);
        rect(x+(rectWidth*i), ypos, rectWidth, (data[i]*2));
        fill(0);
        text((i+1),x+this.width-(rectWidth*i)-25, (y+this.height+20));
        text((i+1)*20,x-20,y+this.height-((i+1)*40)+5);
      }
    }
    strokeWeight(1);
  }
}