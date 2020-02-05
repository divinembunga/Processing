class FiveStarWidget extends Widget{
  Star sOne;
  Star sTwo;
  Star sThree;
  Star sFour;
  Star sFive;
  int amountOfStarsSelected;
  //Still have to make an arraylist of these stars for simpler code.
  FiveStarWidget(int x, int y, int width, int height, int spacing, int event){
   super(x,y,width,height,event);
   sOne = new Star(x+spacing,y+15,20,20,STAR_BUTTON_1);
   sTwo = new Star(x+2*spacing,y+15,20,20,STAR_BUTTON_2);
   sThree = new Star(x+3*spacing,y+15,20,20,STAR_BUTTON_3);
   sFour = new Star(x+4*spacing,y+15,20,20,STAR_BUTTON_4);
   sFive = new Star(x+5*spacing,y+15,20,20,STAR_BUTTON_5);
  }
  void draw(){
   sOne.draw();
   sTwo.draw();
   sThree.draw();
   sFour.draw();
   sFive.draw();
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  void highlightStars(){
    int event = sOne.getEvent(mouseX,mouseY);
      if(event!=EVENT_NULL) sOne.pressStar();
      event = sTwo.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.pressStar();
        sTwo.pressStar();
      }
      event = sThree.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.pressStar();
        sTwo.pressStar();
        sThree.pressStar();
      }
      event = sFour.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.pressStar();
        sTwo.pressStar();
        sThree.pressStar();
        sFour.pressStar();
      }
      event = sFive.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.pressStar();
        sTwo.pressStar();
        sThree.pressStar();
        sFour.pressStar();
        sFive.pressStar();
      }
  }
  void pressStars(){
    println("y");
    int event = sOne.getEvent(mouseX,mouseY);
      if(event!=EVENT_NULL){
        sOne.selectStar();
        amountOfStarsSelected=1;
      }
      event = sTwo.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.selectStar();
        sTwo.selectStar();
        amountOfStarsSelected=2;
      }
      event = sThree.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.selectStar();
        sTwo.selectStar();
        sThree.selectStar();
        amountOfStarsSelected=3;
      }
      event = sFour.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.selectStar();
        sTwo.selectStar();
        sThree.selectStar();
        sFour.selectStar();
        amountOfStarsSelected=4;
      }
      event = sFive.getEvent(mouseX, mouseY);
      if(event!=EVENT_NULL){
        sOne.selectStar();
        sTwo.selectStar();
        sThree.selectStar();
        sFour.selectStar();
        sFive.selectStar();
        amountOfStarsSelected=5;
      }
  }
}