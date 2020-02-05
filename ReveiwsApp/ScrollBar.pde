class ScrollBar {
  int borderXpos;
  int borderYpos;
  int borderWidth;
  int scrollBarWidth;
  int scrollBarHeight;
  int borderHeight = SCREEN_HEIGHT;
  int scrollBarYloc;

  ScrollBar(int borderXpos, int borderWidth)
  {
    this.borderXpos = borderXpos;
    this.borderYpos = 0;
    this.borderWidth = borderWidth;
    this.scrollBarWidth = borderWidth;
    this.scrollBarHeight = borderWidth;
    this.scrollBarYloc = 0;
  }

  int getScrollBarYPos()
  {
    return scrollBarYloc;
  }

  void draw ()
  {
    fill(237, 238, 239);
    rect(borderXpos, borderYpos, borderWidth, borderHeight);
    fill(186, 187, 188);
    rect(borderXpos, scrollBarYloc, scrollBarWidth, scrollBarHeight);
  }

  //Fixed offscreen issues etc & made scrollbar work
  void move(int currentMouseY)
  {
    if (currentMouseY < 0)
    {
      scrollBarYloc = 0;
    } else if (currentMouseY > SCREEN_HEIGHT - scrollBarHeight)
    {
      scrollBarYloc = SCREEN_HEIGHT - scrollBarHeight;
    } else
    {
      scrollBarYloc = currentMouseY;
    }
  }
}