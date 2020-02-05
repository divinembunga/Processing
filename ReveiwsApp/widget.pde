class Widget {
  int x, y, width, height;
  String label; 
  String subLabel;
  int event;
  String userName;
  color widgetColor, labelColor;
  PFont widgetFont; 
  color strokeColor;
  PImage searchIconWidget;
  int originalYPos;
  boolean isReviewWidget;
  Review widgetsReview;
  PImage logo;


  Widget() {
  }

  Widget(int x, int y, PImage logo, int event)
  {
    this.logo = logo;
    this.x=x;
    this.y=y;
    this.event = event;
  }
  Widget(int x, int y, int width, int height, int event){
   this.x=x;
   this.y=y;
   this.width=width;
   this.height=height;
   this.event=event;
  }
  //Chris-27/03/18 Tided up constructors to simplify the code.
  Widget(int x, int y, int width, int height, String label, 
    color widgetColor, int event) {
    this(x,y,width,height,event);
    this.originalYPos = y;
    this.label=label; 
    this.widgetColor=widgetColor; //this.widgetFont=widgetFont;
    isReviewWidget=false;
    labelColor= color(0);
    strokeColor = color(0);
  }

  Widget(int x, int y, int width, int height, String label, 
    color widgetColor, int event, Review widgetsReview) {
    this(x, y, width, height, label, widgetColor, event); 
    this.originalYPos = y;
    this.widgetsReview = widgetsReview;
  }

  Widget(int x, int y, int width, int height, String label, 
    int event, PImage searchIconWidget) {
    this(x, y, width, height, label, color(255), event);
    this.searchIconWidget = searchIconWidget;
  }
  Widget(int x, int y, int width, int height, String label, color widgetColor, int event, String subLabel) {
    this(x, y, width, height, label, widgetColor, event);
    //this.widgetFont=widgetFont;
    this.subLabel=subLabel;
  }
  Widget(int x, int y, int width, int height, String label, 
    color widgetColor, color strokeColor, int event) {
    this(x, y, width, height, label, widgetColor, event);
    this.strokeColor=strokeColor;
    isReviewWidget=true;
    
  }
  void updateWidgetsScroll(ScrollBar scrollBarPassed)
  {
    this.y = originalYPos - scrollBarPassed.getScrollBarYPos();
  }

  void draw()
  {
    if (searchIconWidget!=null)   //Divine- made buttons into a widget with a different constructor
    {
      searchIconWidget.resize(30, 30);
      image(searchIconWidget, 30, 30);
    } else {
      stroke(strokeColor);
      if(isReviewWidget) noStroke();
      fill(widgetColor);
      rect(x, y, width, height);
      fill(labelColor);
    }
    textSize(20);
    if (label!=null)
    {
      text(label, x+10, y+10, this.width-5, this.height);
    }
    if (logo!=null)
    {
      image(logo, x, y);
    }
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
  String getLabel() {//Chris -29/03/18, added this to retrive label from widget.
    return this.label;
  }
  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }
  void setY(int y){
    this.y=y;
  }
  int getHeight()
  {
    return height;
  }
  int getWidth()
  {
    return  width;
  }
  Review getReview()
  {
    return this.widgetsReview;
  }
   String toString(){
     if(this.widgetsReview!=null) return widgetsReview.toString();
     else return "no review " + this.label;
   }
}