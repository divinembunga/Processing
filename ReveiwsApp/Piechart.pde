class Piechart {
  float x;
  float y;
  float diameter;
  int[] data;
  ArrayList<String> listOfBusinessNames;
  color[] starsColors = {color(220, 20, 60), color(255, 0, 255), color(0, 0, 205), color(60, 179, 113), color(255, 255, 51)};
  color[] colors = {color(230, 25, 75), color(60, 180, 75), color(255, 225, 25), color(0, 130, 200), color(245, 130, 48), 
    color(145, 30, 180), color(70, 240, 240), color(240, 50, 230), color(210, 245, 60), color(250, 190, 190), 
    color(0, 128, 128), color(230, 190, 255), color(170, 110, 40), color(255, 250, 200), color(128, 0, 0), 
    color(170, 255, 195), color(128, 128, 0), color(255, 215, 180), color(0, 0, 128), color(128, 128, 128)};
  float lastAngle = 0;
  boolean isStarPiechart;
  String title;
  String subTitle;
  Piechart() {
  }
  Piechart(float x, float y, int diameter, int[] data, boolean isStarPiechart, String title) {
    this.x=x;
    this.y=y;
    this.diameter = diameter; 
    this.data=data;
    this.isStarPiechart=isStarPiechart;
    this.title=title;
    formatData();
    noStroke();
  }
  Piechart(float x, float y, int diameter, int[] data, boolean isStarPiechart, String title, String subTitle) {
    this(x, y, diameter, data, isStarPiechart, title);
    this.subTitle=subTitle;
  }
  Piechart(float x, float y, int diameter, int[] data, boolean isStarPiechart, String title, ArrayList<String> listOfBusinessNames) {
    this(x, y, diameter, data, isStarPiechart, title);
    this.listOfBusinessNames=listOfBusinessNames;
  }
  void draw() {
    noStroke();
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      fill(colors[i]);
      arc(x, y, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
      lastAngle += radians(data[i]);
    }
    if (isStarPiechart) {
      drawStarsLegend();
      textSize(15);
      text(title, this.x-(diameter/2)+15, y+(diameter*5/8));
      text(subTitle, this.x-(diameter/2)+15, y-(diameter*5/8));
    } else {
      drawBusinessLegend();
      textSize(15);
      text(title, this.x-(diameter/2)-20, y+(diameter*5/8));
    }
  }
  void formatData() {
    float temp = 0;
    for (int i=0; i<data.length; i++) {
      temp += data[i];
    }
    temp=360/temp;
    for (int i=0; i<data.length; i++) {
      data[i]= Math.round(data[i]*temp);
    }
  }
  void drawStarsLegend() {    
    for (int i=0; i<starsColors.length; i++) {
      fill(colors[i]);
      rect(this.x+diameter*2/3, (this.y-diameter*1/3)+i*20, 10, 10); 
      fill(0);
      textSize(15);
      text((i+1)+" Stars", (this.x+diameter*2/3)+15, ((this.y-diameter*1/3)-i*20)+88);
    }
  }
  void drawBusinessLegend() {
    for (int i=0; i<listOfBusinessNames.size(); i++) {
      fill(colors[i]);
      rect(this.x-diameter*3/2, (this.y-diameter*4/5)+i*20, 10, 10); 
      fill(0);
      textSize(15);
      text(listOfBusinessNames.get(i), (this.x-diameter*3/2)+15, ((this.y-diameter*4/5)+i*20)+8);
    }
  }
}