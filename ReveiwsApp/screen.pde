class Screen {
  ArrayList < Widget > movingWidgets; //If when scrollbar moves they move, put in here
  ArrayList < Widget > staticWidgets; //Else if dont move put here
  ArrayList < TextWidget >  TextWidgetList;
  ArrayList <Review> currentSearch;
  Query currentQuery;
  //Divine 30/3/18 Major cleaning of code
  int event;
  color backgroundColor = SKY;
  int screenNumber;
  Widget widget1, widget2, widget3, backButton;
  ScrollBar scrollBar;
  PImage home=loadImage("home.png");  //Divine here- just designed buttons to make the dsiplay a little nicer-they're 600x600 so we'll have to resize 
  Review currentReview;
  Barchart currentBarchart;
  String reviewInfo;
  int place = 10;
  int biz1Xpos = 0 ;
  int biz2Xpos = -SCREEN_WIDTH ;
  int biz3Xpos = SCREEN_WIDTH ;
  int picDelay = 300;
  int picDelayCounter = 0;
  Widget homeWidget;
  Widget userButton;
  Widget contactButton;
  Widget menuButton;
  Widget writeReviewWidget;
  
  Screen(color backgroundColor, int screenNumber)
  {
    this.backgroundColor = backgroundColor;
    this.screenNumber=screenNumber;
    //this.logo = loadImage("logo.png");
    movingWidgets= new ArrayList < Widget >();
    staticWidgets= new ArrayList < Widget >();
    TextWidgetList = new ArrayList < TextWidget >();
    scrollBar = new ScrollBar(SCREEN_WIDTH - SCROLLBAR_WIDTH, SCROLLBAR_HEIGHT);
    createWidgets();
  }

  Screen(color backgroundColor, int screenNumber, ArrayList<Review> currentSearch)
  {
    this.backgroundColor = backgroundColor;
    this.screenNumber=screenNumber;
    movingWidgets= new ArrayList < Widget >();
    staticWidgets= new ArrayList < Widget >();
    TextWidgetList = new ArrayList < TextWidget >();
    scrollBar = new ScrollBar(SCREEN_WIDTH - SCROLLBAR_WIDTH, SCROLLBAR_HEIGHT);
    this.currentSearch = currentSearch;
    if (screenNumber==HOMESCREEN) {
      createHomeScreenWidgets(new Query(this.currentSearch).listOfBusinessNames());
    }
    createWidgets();
  }
  Screen(color backgroundColor, int screenNumber, Review currentReview)
  {
    this.backgroundColor = backgroundColor;
    this.screenNumber=screenNumber;
    movingWidgets= new ArrayList < Widget >();
    staticWidgets= new ArrayList < Widget >();
    TextWidgetList = new ArrayList < TextWidget >();
    scrollBar = new ScrollBar(SCREEN_WIDTH - SCROLLBAR_WIDTH, SCROLLBAR_HEIGHT);
    this.currentReview = currentReview;
    createWidgets();
  }
  Screen(color backgroundColor, int screenNumber, Query currentQuery) {
    this.backgroundColor = backgroundColor;
    this.screenNumber=screenNumber;
    movingWidgets= new ArrayList < Widget >();
    staticWidgets= new ArrayList < Widget >();
    TextWidgetList = new ArrayList < TextWidget >();
    scrollBar = new ScrollBar(SCREEN_WIDTH - SCROLLBAR_WIDTH, SCROLLBAR_HEIGHT);
    this.currentQuery = currentQuery;
    createWidgets();
    int[] data = {0};
    currentBarchart = new Barchart(SCREEN_WIDTH*1/7, SCREEN_HEIGHT/2, 200, 200, data, "TOTAL STAR RATINGS");
  }


  void createBusinessWidgets(ArrayList<Review> reviews) {
    for (int i=0; i<reviews.size(); i++) {

      ReviewWidget currentWidget = new ReviewWidget(SCREEN_WIDTH/2 - REVIEW_BOX_WIDTH/2, i*120+120, REVIEW_BOX_WIDTH, REVIEW_BOX_HEIGHT, LOAD_BUSINESS_BUTTON, reviews.get(i), 
        true, false, this);
      movingWidgets.add(currentWidget);
    }
  }
  void reorderBusinessWidgets(ArrayList<Widget> widgets){
    for (int i = 0; i < widgets.size(); i++) { 
      if (widgets.get(i).getReview()!=null) {
      ReviewWidget w = new ReviewWidget(SCREEN_WIDTH/2 - REVIEW_BOX_WIDTH/2, i*120+120, REVIEW_BOX_WIDTH, REVIEW_BOX_HEIGHT, LOAD_BUSINESS_BUTTON, widgets.get(i).getReview(), 
        true, false, this);
        widgets.remove(i);
        widgets.add(i, w);
      }
    }
  }
  void reorderWidgets(ArrayList<Widget> widgets) {
    for (int i = 0; i < widgets.size(); i++) { 
      Widget w = new Widget(SCREEN_WIDTH/2 - WIDGET_WIDTH/2, (i*70)+110, WIDGET_WIDTH, WIDGET_HEIGHT, widgets.get(i).getLabel(), color(255), color(255), HOME_BUSINESS_BUTTON);
        widgets.remove(i);
        widgets.add(i, w);
    }
  }
  void createHomeScreenWidgets(ArrayList<String> businessNames)      //hannah here, creating the business widgets for the homeScreen
  {
    for (int i = 0; i < businessNames.size(); i++)
    {
      Widget currentWidget = new Widget(SCREEN_WIDTH/2 - WIDGET_WIDTH/2, (i*70)+110, WIDGET_WIDTH, WIDGET_HEIGHT, businessNames.get(i), color(255), color(255), HOME_BUSINESS_BUTTON); //Chris -27/03/18, changed this function so it only displays
      movingWidgets.add(currentWidget);                                                                                // a list of business names, changed event to a new event button.//Stephen changed constants moved it etc
    }
  }


  void createUsernameWidgets(ArrayList<String> userNames) // Divine29/3/18 fixed the username widgets
  {
    for (int i = 0; i<userNames.size(); i++)
    {
      Widget userName = new Widget(SCREEN_WIDTH/2 - WIDGET_WIDTH/2, (i*50)+110, WIDGET_WIDTH, WIDGET_HEIGHT, userNames.get(i), color(255), color(255), USER_WIDGET); //hannah changing this slightly so that we can see the users reviews
      movingWidgets.add(userName);
    }
  }

  void menuWidgets() 
  {
    userButton = new Widget(SCREEN_WIDTH- 360, 60, 120, 30, "All Users", color(SKY), USER_BUTTON);  // Hannah -  creating drop down menu        
    contactButton = new Widget(SCREEN_WIDTH- 360, 90, 120, 30, "Contact Us", color(SKY), CONTACT_BUTTON);
    writeReviewWidget = new Widget(SCREEN_WIDTH- 360, 120, 120, 30, "Write Review", color(SKY), WRITE_REVIEW_BUTTON);
  }


  //Stephen - I think when each widget is created it should correspond to a review, therefore when clicked could load the review. 
  void createWidgets() {
    if (screenNumber == HOMESCREEN ) 
    {
      //HomeScreen - Trending business
      TextWidget textWidget1 = new TextWidget(SCREEN_WIDTH/2 - SEARCHBAR_WIDTH/2, 30, SEARCHBAR_WIDTH, SEARCHBAR_HEIGHT, "search", color(255), TEXT_WIDGET, 100);
      //hannah creating user widgets
      //hannah here, widget for most Recent and top rated queries
      menuButton = new Widget(SCREEN_WIDTH- 360, 30, 120, 30, "Menu", color(SKY), MENU_BUTTON); //Hannah - creating drop down menu widget
      menuWidgets();
      Widget topRatedWidget = new Widget(SCREEN_WIDTH- 200, 30, 120, 30, "Top Rated", color(SKY), EVENT_BUTTON_TOP_RATED_HOMESCREEN, currentSearch.get(1));
      
      
      TextWidgetList.add(textWidget1);
      Widget homeWidget = new Widget(0, -20, logo, HOME_BUTTON);
      staticWidgets.add(homeWidget);
      staticWidgets.add(topRatedWidget);
      staticWidgets.add(menuButton);
    } else if (screenNumber == SEARCH_RESULT_SCREEN) {
      //This screen displays search results
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      Widget mostRecent = new Widget(SCREEN_WIDTH - 360, 30, 120, 30, "Most Recent", color(SKY), EVENT_BUTTON_MOST_RECENT);
      Widget topRatedWidget = new Widget(SCREEN_WIDTH- 200, 30, 120, 30, "Top Rated", color(SKY), EVENT_BUTTON_TOP_RATED, currentSearch.get(1));
      staticWidgets.add(topRatedWidget);
      staticWidgets.add(mostRecent);
      staticWidgets.add(backButton);
      createBusinessWidgets(currentSearch);  
      Widget homeWidget = new Widget(0, -20, logo, HOME_BUTTON);
      staticWidgets.add(homeWidget);
      //text(currentReview.getUser_name(), 30, 30);
    } else if ( screenNumber == REVIEW_SCREEN)
    {
      ReviewWidget reviewWidget = new ReviewWidget(100, 120, 450, 100, LOAD_BUSINESS_BUTTON, this.currentReview, true);
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      Widget homeWidget = new Widget(0, -20, logo, HOME_BUTTON);
      //Widget nextButton =  new Widget(SCREEN_WIDTH - BACKBUTTON_WIDTH*2, 30, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Next", color(WATERMELON), NEXT_BUTTON);   //hannah creating a next button function//Stephen moved it, also doesnt work?
      staticWidgets.add(reviewWidget);
      staticWidgets.add(backButton);
      staticWidgets.add(homeWidget);
      //staticWidgets.add(nextButton);
      //reviewInfo = currentReview.toString();
      //currentBarchart = new Barchart(SCREEN_WIDTH/2 - BARCHART_SIZE/2, BORDER_HEIGHT + BORDER_HEIGHT/4, currentReview);
      currentBarchart = new Barchart(SCREEN_WIDTH - BARCHART_SIZE-50, BORDER_HEIGHT + BORDER_HEIGHT/4, currentReview); //Divine-2/4/18 Moved the barchart more over to the right so it doesn't mess up with the review
    } else if (screenNumber == WELCOMESCREEN)
    {
      Widget homeWidget = new Widget(0, -20, logo, HOME_BUTTON);
      staticWidgets.add(homeWidget);
      Widget enterWidget = new Widget(0, SCREEN_HEIGHT - SCREEN_HEIGHT/4, SCREEN_WIDTH, SCREEN_HEIGHT/4, "Click to see the range of business reviews", NEUTRAL, CLICK_TO_ENTER);
      staticWidgets.add(enterWidget);
    } else if (screenNumber == USER_SCREEN)
    {
      Widget homeWidget = new Widget(0, -20, logo, HOME_BUTTON);
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      staticWidgets.add(homeWidget);
      staticWidgets.add(backButton);
    } else if (screenNumber == USER_REVIEW_SCREEN)
    {
      createBusinessWidgets(currentSearch);
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      staticWidgets.add(backButton);
    } else if (screenNumber == CONTACT_SCREEN)
    {
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      staticWidgets.add(backButton);
    }
    else if (screenNumber == WRITE_REVIEW_SCREEN)
    {
      Widget backButton = new Widget(SCREEN_WIDTH/2 - BACKBUTTON_WIDTH/2, BORDER_HEIGHT/2 - BACKBUTTON_HEIGHT/2, BACKBUTTON_WIDTH, BACKBUTTON_HEIGHT, "Back", color(CARBON), BACK_BUTTON);
      Widget submitWidget = new Widget(SCREEN_WIDTH/2-60, SCREEN_HEIGHT-BORDER_HEIGHT/2, 120, 30, "Submit", color(SKY), SUBMIT_BUTTON);
      Widget userNameWidget = new Widget(SCREEN_WIDTH/2-120, BORDER_HEIGHT, 120, 30, "Username:", color(SKY), EVENT_NULL);
      TextWidget userNameText = new TextWidget(SCREEN_WIDTH/2, BORDER_HEIGHT, SEARCHBAR_WIDTH, 30, "e.g Francois", color(255), TEXT_WIDGET, 200);
      TextWidget reviewText = new TextWidget(BORDER_HEIGHT,2*BORDER_HEIGHT,SCREEN_WIDTH-SCROLLBAR_WIDTH-BORDER_HEIGHT,SCREEN_HEIGHT-2*BORDER_HEIGHT-50, "Write review here.", color(255), TEXT_WIDGET, 200);
      FiveStarWidget fiveStarWidget = new FiveStarWidget(SCREEN_WIDTH-220,BORDER_HEIGHT+30,180,40,30,FIVE_STAR_WIDGET_BUTTON);
      //Star star = new Star(400,400,20,20,"",color(150),STAR_BUTTON);
      staticWidgets.add(backButton);
      staticWidgets.add(fiveStarWidget);
      staticWidgets.add(userNameWidget);
      staticWidgets.add(submitWidget);
      TextWidgetList.add(userNameText);
      TextWidgetList.add(reviewText);
    }
  }



  int getEvent(int mX, int mY)
  {

    for (int i = 0; i< movingWidgets.size(); i++) 
    {
      Widget aWidget = (Widget) movingWidgets.get(i);
      if (mX>aWidget.x && mX < aWidget.x+width && mY > aWidget.y && mY < aWidget.y+height) 
      {  
        return event;
      }
    }
    for (int i = 0; i< staticWidgets.size(); i++) 
    {
      Widget aWidget = (Widget) staticWidgets.get(i);
      if (mX>aWidget.x && mX < aWidget.x+width && mY > aWidget.y && mY < aWidget.y+height) 
      {  
        return event;
      }
    }
    for (int i = 0; i <TextWidgetList.size(); i++)
    {
      TextWidget textWidget = (TextWidget)TextWidgetList.get(i);
      if (mX>textWidget.x && mX < textWidget.x+width && mY > textWidget.y && mY < textWidget.y+height) 
      {  
        return event;
      }
    }
    return EVENT_NULL;
  }

  void draw() {
    background(NEUTRAL);

    if (screenNumber!= WELCOMESCREEN && screenNumber != REVIEW_SCREEN)
    {
      scrollBar.draw();
    }
    for (int i =0; i<  movingWidgets.size(); i++)
    {
      try {
        ReviewWidget currentWidget = (ReviewWidget) movingWidgets.get(i);
        currentWidget.updateUserNameScroll(scrollBar);
        stroke(currentWidget.strokeColor);
        currentWidget.draw();
      } 
      catch (Exception e) {
        //println(e);
      }
      Widget currentWidget = movingWidgets.get(i);
      currentWidget.updateWidgetsScroll(scrollBar);
      stroke(currentWidget.strokeColor);
      currentWidget.draw();
    }
    stroke(0);

    if (screenNumber == CONTACT_SCREEN)
    {
      background(SKY);
      textFont(font);
      textSize(50);
      textAlign(LEFT);
      fill(0);
      text("Contact Us:", 100, 150);
      textSize(30);
      textAlign(LEFT);
      text("Address: Trinity College Dublin, College Green, Dublin 2", 100, 300);
      text("Email us with any queries - reviewforyou@gmail.com", 100, 350);
      text("Telephone - 0133021348", 100, 400);
      image(location, 400, 400);
    }

    if (screenNumber == USER_SCREEN)
    {
      image(sallyAd, 50, 140);
      image(dollaramaAd, 50, 470);        //Hannah, adding adds to the user screen
      image(sandwichAd, 900, 140);
    }
    fill(DARK_BLUE);
    if(screenNumber == REVIEW_SCREEN)
    {
       rect(0, 0, SCREEN_WIDTH, BORDER_HEIGHT);
      image(logo, 0, -20);  
    }
    else if (screenNumber!= WELCOMESCREEN)
    {
      rect(0, 0, SCREEN_WIDTH-SCROLLBAR_WIDTH, BORDER_HEIGHT);
      image(logo, 0, -20);      //Hannah - putting logo back on screen
      //text(currentReview.getBusiness_name(), 30, 30);
      //hannah here, just putting in a banner for our home screen and review class to have the format of an actual website also trying to get the business name on the banner, null pointer exception occuring
    } else 
    {
      //Getting weird error where first two go through automatically but then after that it stops on each one as it should.
      if (biz1Xpos > SCREEN_WIDTH * 2)
      {
        picDelayCounter = 0;
      }
      if (biz2Xpos > SCREEN_WIDTH * 2)
      {
        picDelayCounter = 0;
      }
      if (biz3Xpos > SCREEN_WIDTH * 2)
      {
        picDelayCounter = 0;
      }
      image(business1, biz1Xpos, 0);
      image(business2, biz2Xpos, 0);
      image(business3, biz3Xpos, 0);
      if (biz1Xpos > SCREEN_WIDTH * 2)
      {
        biz1Xpos = -SCREEN_WIDTH;
      }
      if (biz2Xpos > SCREEN_WIDTH * 2)
      {
        biz2Xpos = -SCREEN_WIDTH;
      }
      if (biz3Xpos > SCREEN_WIDTH * 2)
      {
        biz3Xpos = -SCREEN_WIDTH;
      }
      if (picDelayCounter > picDelay)
      {
        biz1Xpos+=5;
        biz2Xpos+=5;
        biz3Xpos+=5;
      }
      picDelayCounter++;
    }

    
    for (int i =0; i < TextWidgetList.size(); i++)
    {
      TextWidget textWidget = (TextWidget)TextWidgetList.get(i);
      textWidget.draw();
      stroke(textWidget.strokeColor);
    }
    for (int i =0; i<  staticWidgets.size(); i++)
    {
      Widget currentWidget = (Widget) staticWidgets.get(i);
      currentWidget.draw();
      stroke(currentWidget.strokeColor);
    }
    if (currentBarchart!= null)
    {
      currentBarchart.draw();
    }
    if (screenNumber == HOMESCREEN)
    {
      if (mouseX > menuButton.getX() && mouseX < menuButton.getX() + menuButton.getWidth() && mouseY > menuButton.getY() && mouseY < menuButton.getHeight()*5)
      {
        userButton.draw();
        contactButton.draw();
        writeReviewWidget.draw();
      }
    }
  }
       /*
      if(mouseX > reviewButton.getX() && mouseX < reviewButton.getX() + reviewButton.getWidth()
    }
    //homeWidget.draw(); //Having a bug where this appears on every screen except first one, should appear on all - Moved to static widgets, still having same issue?
  }
  */
  void addMovingWidget(Widget widget) {
    try {
      this.movingWidgets.add(widget);
    } 
    catch (Exception e) {
    }
  }
  void changeCurrentBarchart(int[] data) {
    this.currentBarchart= new Barchart(SCREEN_WIDTH*1/7, SCREEN_HEIGHT/2, 200, 200, data, "TOTAL STAR RATING");
  }
  void sortWidgetsByStarRatings() {
    Collections.sort(this.movingWidgets, new starRatingWidgetComparator());
    reorderBusinessWidgets(this.movingWidgets);
  }
  void sortWidgetsByAverageStarRatings() {
    println("n");
    Collections.sort(this.movingWidgets, new averageStarRatingWidgetComparator(new Query(this.currentSearch)));
    reorderWidgets(this.movingWidgets);
  }
  /*
  ArrayList<Review> sortTopRated(ArrayList< Review> reviewList) {
   ArrayList< Review> sortedList = new ArrayList();
   ArrayList<Review> oneStars = new ArrayList<Review>();
   ArrayList<Review> twoStars = new ArrayList<Review>();
   ArrayList<Review> threeStars = new ArrayList<Review>();
   ArrayList<Review> fourStars = new ArrayList<Review>();
   ArrayList<Review> fiveStars = new ArrayList<Review>();
   for (Review review : reviewList) {
   switch(review.getStars()) {
   case 1:
   oneStars.add(review); 
   break;
   case 2:
   twoStars.add(review); 
   break;
   case 3:
   threeStars.add(review); 
   break;
   case 4:
   fourStars.add(review); 
   break;
   case 5:
   fiveStars.add(review); 
   break;
   }
   }
   sortedList.addAll(fiveStars);
   sortedList.addAll(fourStars);
   sortedList.addAll(threeStars);
   sortedList.addAll(twoStars);
   sortedList.addAll(oneStars);
   return sortedList;
   }
   
   
   
   */

  /*

   ArrayList sortMostRecent(ArrayList< Review> reviewList) // hannah here, I created a function to sort the business' by their stars for the top-rated query 
   {
   ArrayList< Review> sortedList = new ArrayList();
   
   for (int j = 0; j < reviewList.size(); j++)
   {
   for (int i = 0; i < sortedList.size(); i++)
   {
   if (businessName.getStars() == reviewList.get(i).getStars())
   {
   Review sorted =  sortedList.get(i);
   sorted = reviewList.get(j);
   }
   }
   }
   
   return sortedList;
   }
   }*/
}