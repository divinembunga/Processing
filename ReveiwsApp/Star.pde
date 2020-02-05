class Star extends Widget {
  boolean isMouseHovering;
  boolean isStarSelected;
  int startTime;
  final int WAIT_TIME = 200;
  Star(int x, int y, int width, int height, int event) {
    super(x, y, width, height, event);
  }
  void draw() {
    if (isStarSelected) fill(GOLD);
    else {
      if (isMouseHovering) fill(GOLD);
      else fill(255);
    }
    float x=this.x;
    float y=this.y;
    float radius1=7;
    float radius2=15;
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
    if (isMouseHovering&&millis()-startTime>=WAIT_TIME) isMouseHovering=false;
  }
  int getEvent(int mX, int mY) {
    if (mX>x-12 && mX < x-12+width && mY >y-12 && mY <y-12+height) {
      return event;
    }
    return EVENT_NULL;
  }
  void mouseHovering() {
    isMouseHovering = true;
    startTime = millis();
  }
  void pressStar() {
    mouseHovering();
  }
  void selectStar() {
    isStarSelected=true;
  }
}