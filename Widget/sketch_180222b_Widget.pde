PFont stdFont;
final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4=4;
final int EVENT_NULL=0;
color squareColour, screen1Colour, screen2Colour;
Widget widget1, widget2, widget3, widget4;
Screen screen1, screen2;
ArrayList widgetList;
Screen currentScreen;


void setup(){
  stdFont=loadFont("Corbel-25.vlw");
  textFont(stdFont);
  screen1Colour = color(148,99,184);
  screen2Colour = color(69,222,217);
  screen1 = new Screen(screen1Colour);
  screen2 = new Screen(screen2Colour);
  currentScreen = screen1;

  widget1=new Widget(100, 100, 200, 40,
  "Button1", color(100),
  stdFont, EVENT_BUTTON1);
  widget2=new Widget(100, 200, 200, 40,
  "Forward -->", color(69,222,69),
  stdFont, EVENT_BUTTON2);
  widget3=new Widget(100, 100, 180, 40,
  "Button2", color(100),
  stdFont, EVENT_BUTTON3);
  widget4=new Widget(100, 200, 180, 40,
  "Backward <--", color(222,89,69),
  stdFont, EVENT_BUTTON4); 
  screen1.addWidget(widget1);
  screen1.addWidget(widget2);
  screen2.addWidget(widget3);
  screen2.addWidget(widget4);
  size(400, 400);
  
  

}

void draw(){
  currentScreen.draw();
}
void mousePressed(){
  currentScreen.mousePressed();
}