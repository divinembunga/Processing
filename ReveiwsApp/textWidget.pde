class TextWidget extends Widget {

  int maxLength;  

  TextWidget(int x, int y, int width, int height, String label, color widgetColor, 
    int event, int maxLength ) {
    super(x, y, width, height, label, widgetColor, event);
    this.maxLength = maxLength;
    labelColor = color(200);
  }

  void append(char s) {
    labelColor = color(0);
    if (s == BACKSPACE)
    {
      if (!label.equals(""))
      {
        this.label=label.substring(0, label.length()-1);
      }
    } else if (label.length() < maxLength)
      this.label=label+str(s);
  }
  /* Chris-
   Added clearBox function to textWidget so that searchbar clears every time you click on it
   21/03/18
   */
  void clearBox() {
    this.label = "";
  }

  String getLabel()
  {
    return this.label;
  }
}