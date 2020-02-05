class Screen{
  ArrayList<Widget> widgetList = new ArrayList<Widget>();
  color backgroundColour;
  int event;
  
  Screen(color backgroundColour){
    this.backgroundColour = backgroundColour;
  }
  
  void draw(){
    background(backgroundColour);
    drawWidgets();
    
  }
  
   void addWidget(Widget widget){
    widgetList.add(widget);
  }
  
  int getEvent(int mX, int mY){
    for(int i = 0; i < widgetList.size(); i++){
      Widget widget = widgetList.get(i);
      if(mX>widget.x && mX < widget.x+width && mY >widget.y && mY <widget.y+height){
        return event;
       }
    } 
    return EVENT_NULL;
  }
  
  void drawWidgets(){
    for(int i = 0; i <widgetList.size(); i++){
      Widget widget = widgetList.get(i);
      widget.draw();
    }
  }
  
  void mousePressed(){
    int event;
    for(int i =0; i<widgetList.size(); i++){
       Widget aWidget = (Widget) widgetList.get(i);
       event = aWidget.getEvent(mouseX,mouseY);
       switch(event) {
         case EVENT_BUTTON1:
           println("Button1");
           break;
         case EVENT_BUTTON2:
           println("Forward");
           currentScreen = screen2;
           break;
         case EVENT_BUTTON3:
           println("Button2");
           break;
         case EVENT_BUTTON4:
           println("Backward");
           currentScreen = screen1;
           break;
       }  
    }
  }
}