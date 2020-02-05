PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_NULL=0;

Widget widget1, widget2,widget3;
ArrayList widgetList;

void setup(){
  stdFont=loadFont("Corbel-25.vlw");
  textFont(stdFont);
 
  widget1=new Widget(50, 100, 180, 40,
  "Red!", color(255,0,0),
  stdFont, EVENT_BUTTON1);
  widget2=new Widget(50, 200, 180, 40,
  "Green!", color(0,75,0),
  stdFont, EVENT_BUTTON2);
  widget3=new Widget(50, 300, 180, 40,
  "Blue!", color(0,0,220),
  stdFont, EVENT_BUTTON3);
  
  
  size(400, 400);
  background(0);
  
  widgetList = new ArrayList();
  widgetList.add(widget1); widgetList.add(widget2); widgetList.add(widget3);
  
}

void draw(){
  for(int i = 0; i<widgetList.size(); i++){
    Widget bWidget = (Widget)widgetList.get(i);
    bWidget.draw();
    bWidget.mouseMoved();
    }
  }


void mousePressed(){
  int event;
  
  for(int i = 0; i<widgetList.size(); i++){
  Widget aWidget = (Widget) widgetList.get(i);
       event = aWidget.getEvent(mouseX,mouseY);
       switch(event) {
         case EVENT_BUTTON1:
           println("button 1!");
           fill(255,0,0);
           rect(300,200,50,50);
           break;
         case EVENT_BUTTON2:
           println("button 2!");
           fill(0,75,0);
           rect(300,200,50,50);
           break;
         case EVENT_BUTTON3:
           println("button 3!");
           fill(0,0,220);
           rect(300,200,50,50);
           break;
         
       }  
       
  }
  
}