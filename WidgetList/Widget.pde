class Widget{
  int x,y,width,height;
  String label; int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  
  Widget(int x, int y, int width, int height, String label,
  color widgetColor, PFont widgetFont, int event){
    this.x=x; this.y=y; this.width=width; this.height=height;
    this.label=label; this.event=event;
    this.widgetColor=widgetColor; this.widgetFont=widgetFont;
    labelColor=color(0);
  }
  void draw(){
    fill(widgetColor);
    rect(x,y,width,height);
    fill(labelColor);
    text(label,x+10,y+height-10);
  }
  
  int getEvent(int mX, int mY){
    if(mX>x && mX<x+width && mY>y && mY<y+height){
      return event;
    }
    return EVENT_NULL;
  }
  
  void mouseMoved(){
  int event;
  for(int i=0;i<widgetList.size();i++){
    Widget aWidget=(Widget) widgetList.get(i);
    event= aWidget.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_BUTTON1:
        stroke(255);
        aWidget.draw();
        println("button 1!");
        break;
      case EVENT_BUTTON2:
        stroke(255);
        aWidget.draw();
        println("button 2!");
        break;
      case EVENT_BUTTON3:
        stroke(255);
        aWidget.draw();
        println("button 3!");
        break;
      default:
         stroke(0);
         aWidget.draw();
         break;
     
    }
  }
}

}