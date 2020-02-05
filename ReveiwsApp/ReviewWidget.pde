// Chris -29/03/18, Added ReviewWidget class for displaying reviews using widgets. 
class ReviewWidget extends Widget {
  boolean isFullScreenWidget;
  boolean hasWidget;
  PShape[] stars;
  Screen screen;
  String  userName;
  PImage profilePic;
  Widget userProfileName;
  ReviewWidget(int x, int y, int width, int height, int event, Review review, boolean isFullScreenWidget){
    super(x, y, width, height, "", 255, event, review);
    this.isFullScreenWidget=isFullScreenWidget;
    if (isFullScreenWidget) {
      this.x=0;
      this.y=100;
      this.width = SCREEN_WIDTH;
      
      this.height= SCREEN_HEIGHT;
    }
    this.strokeColor = color(255);
    this.labelColor = color(0);
    stars = new PShape[this.widgetsReview.getStars()];
    this.userName = review.getUser_name();
    this.profilePic = loadImage("profile.png");
  }
  ReviewWidget(int x, int y, int width, int height, int event, Review review, boolean hasWidget, boolean isFullScreenWidget, Screen screen) {
    this(x,y,width,height,event,review,isFullScreenWidget);
    this.hasWidget=hasWidget;
    this.screen = screen;
    userProfileName = new Widget(this.x+460,this.y, 80, 40, review.getUser_name(),color(255),color(255),USER_WIDGET);
    screen.addMovingWidget(userProfileName);
  }
  @Override
    void draw() {
    //Draw white background
    stroke(255);
    strokeWeight(2);
    fill(widgetColor);
    rect(x, y, this.width, this.height);
    //Draw business name in top right, and the text of the review.
    drawProfile();
    if (this.widgetsReview!=null) {
      drawAllText();
    }
    

    //Draw stars, if there are any.
    if (stars.length!=0) {
      for (int i=0; i<stars.length; i++) {
        fill(GOLD);
        noStroke();
        drawStar(i);
      }
    }
    
    if(this.userProfileName!=null){
      //noStroke();
      stroke(userProfileName.strokeColor);
      strokeWeight(2);
      this.userProfileName.draw();
    }
    
    strokeWeight(1);
  }
  void drawStar(int index) {
    float x=this.x+(width-95);
    float y;
    if (isFullScreenWidget) {
      y=150;
    } else {
      y=this.y+15;
    }
    switch (index) {
    case 1: 
      x=x+20; 
      break;
    case 2: 
      x=x+40; 
      break;
    case 3: 
      x=x+60; 
      break;
    case 4: 
      x=x+80; 
      break;
    default:
    }
    float radius1=3;
    float radius2=7;
    float angle = TWO_PI / 5;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  //Stephen added this 
  void drawProfile()
  {
    //Profile pic and name - Stephen
    rect(x + width, y, height, height);
    fill(0);
    //textSize(15);
    //text(userName, x+width + height*1/4, y+20);
    profilePic.resize(height - 50, height - 50);
    image(profilePic, x+ width + height*1/4, y + 40);
  }

  void drawAllText() {
    fill(labelColor);

    if (isFullScreenWidget) {
      //Business name
      textSize(30);
      text(this.widgetsReview.getBusiness_name(), x+10, y+30);
      //User name
      textSize(30);
      text("User: " + this.widgetsReview.getUser_name(), x+12, y+60);
      //Date
      textSize(30);
      text(this.widgetsReview.getDate(), this.width-150, y+40);  //Divine 31/3/18 adjusted the date to be more further in, undid that-2/4/18
      //Review text
      textSize(25);
      text("\" " + this.widgetsReview.getReview() + " \"", x+5, y+100, this.width-700, this.height-35); //Divine 31/3/18 -Adjusting the size of the review to make it half the size of the screen
    } else if (!isFullScreenWidget) {
      //Business name
      textSize(20);
      text(this.widgetsReview.getBusiness_name(), x+10, y+22);
      //Review text
      textSize(12);
      text("\" " + this.widgetsReview.getReview() + " \"", x+10, y+40, this.width-20, this.height-35);
    }
  }
  void updateUserNameScroll(ScrollBar scrollBarPassed){
    userProfileName.setY(originalYPos - scrollBarPassed.getScrollBarYPos());
  }
  void setFullScreen() {
    this.isFullScreenWidget=true;
  }
}