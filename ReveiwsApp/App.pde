//TO DO

//fix weird bug with next button

ArrayList<Review> reviewList;
ArrayList<Review> currentSearch;
Table table;
PFont font;
PFont homeFont;
int counter;
Widget widget1, widget2, widget3;
ArrayList widgetlist;
TextWidget focus;
int screenNumber;
Screen screen1;
Screen screen2;
Screen screen3;
Screen screen4;
Screen screen5;
Screen screen6;
Screen currentScreen;
Screen previousScreen;
Screen welcomeScreen;
PImage logo;
PImage business1;
PImage business2;
PImage business3; 

Barchart exampleBarchart;
Piechart piechart;
Piechart piechartForReviewAmounts;
PImage bg;
Query currentQuery;
Review reviewTest;
Review review;
float circleHomeR = 100;
PImage location;        //Hannah - google map location image for the contact us page
PImage sallyAd;          //Hannah - adding adds to put something else on the user screen cause it was so bare
PImage dollaramaAd;
PImage sandwichAd;

void settings()
{
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup()
{
  business1 = loadImage("quiktrip.jpg");
  business2 = loadImage("sally.JPG");
  business3 = loadImage("pharmacy.jpg");
  business1.resize(SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_HEIGHT/4);
  business2.resize(SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_HEIGHT/4);
  business3.resize(SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_HEIGHT/4);
  reviewList = new ArrayList<Review>();
  table = loadTable("reviews.csv", "header"); 
  currentQuery = new Query(reviewList);
  loadInData();
  screenNumber = WELCOMESCREEN; //SHOULDBE WELCOME
  welcomeScreen = new Screen(color(SKY), WELCOMESCREEN);
  screen1 = new Screen(color(SKY), HOMESCREEN, reviewList );
  screen4 = new Screen(color(SKY), USER_SCREEN, reviewList);
  screen6 = new Screen(color(SKY), CONTACT_SCREEN);
  widgetlist = new ArrayList();
  focus = null;
  homeFont = loadFont("GillSansMT-Bold-48.vlw");
  background(255);
  font = loadFont("Serif-30.vlw");
  textFont(font, 20);
  counter = 0;
  logo = loadImage("review4you.png");  //hannah here, having issues with logo - fixed stephen
  location = loadImage("location.png");
  sallyAd = loadImage("sallyAD.JPG");
  dollaramaAd = loadImage("dollaramaAD.jpg");
  sandwichAd = loadImage("sandwichAd.jpg");
  sallyAd.resize(300, 300);
  logo.resize(150, 150);
  dollaramaAd.resize(300, 300);
  sandwichAd.resize(300, 300);
  reviewTest = new Review("", "y", "y", "y", 5, "y", "y", 4, 3, 2);
  piechartForReviewAmounts = new Piechart(SCREEN_WIDTH*8/9, SCREEN_HEIGHT/2, 200, currentQuery.businessRatios(), false, "PERCENTAGE OF TOTAL REVIEWS", currentQuery.listOfBusinessNames());
}

void draw()
{
  /* Chris cleaned up unnecessary code from main draw
   21/03/18
   */

  if (screenNumber == WELCOMESCREEN)
  {
    currentScreen = welcomeScreen;
    //textFont(homeFont);
    textAlign(CENTER);
  }

  if (screenNumber == HOMESCREEN)
  {
    textAlign(LEFT);

    currentScreen = screen1;
    //currentScreen.createHomeScreenWidgets(currentQuery.listOfBusinessNames()); //Chris-27/02/18-Changed homescreen widgets so they are simply a list of the business names.
  } else if (screenNumber == SEARCH_RESULT_SCREEN)
  {
    textAlign(LEFT);
    previousScreen = currentScreen;
    currentScreen = screen2;
  } else if (screenNumber == REVIEW_SCREEN)
  {
    textAlign(LEFT);
    previousScreen = currentScreen;
    currentScreen = screen3;
    // text(this.review.getBusiness_name(), 30, 30); //null pointer exception
  } else if (screenNumber == USER_SCREEN)
  {
    textAlign(LEFT);
    previousScreen = currentScreen;
    currentScreen = screen4;
    //currentScreen.createUsernameWidgets(reviewList); //hannah trying to implement a review system for the usernames keep getting null pointer exception
    currentScreen.createUsernameWidgets(currentQuery.listOfUsernames()); //Divine 29/3/18 this only works when screen is equal to 1 - fixed hannah changed to screen 4 as screen1 refers to businesses
  } else if (screenNumber == USER_REVIEW_SCREEN)
  {
    textAlign(LEFT);
    previousScreen = currentScreen;
    currentScreen = screen5;      //hannah - creating a new user review screen
  } else if (screenNumber == CONTACT_SCREEN)
  {
    previousScreen = currentScreen;
    currentScreen = screen6;
  }


  currentScreen.draw();
  if (piechart!=null&&screenNumber==HOMESCREEN) {
    piechart.draw();
  }
  if (screenNumber==HOMESCREEN) {
    piechartForReviewAmounts.draw();
  }
  // image(logo, 0, -20);
  if (screenNumber == WELCOMESCREEN)
  {
    image(logo, 0, SCREEN_HEIGHT - SCREEN_HEIGHT/4);
  }
}

void mouseDragged()
{

  if (mouseX > currentScreen.scrollBar.borderXpos && mouseX < currentScreen.scrollBar.borderXpos + currentScreen.scrollBar.borderWidth)
  {
    currentScreen.scrollBar.move(mouseY);
  }
}
void mouseWheel() {
}

void mousePressed() {
  int event;

  if (screenNumber == HOMESCREEN)
  {
    event = currentScreen.userButton.getEvent(mouseX, mouseY);
    if (event == USER_BUTTON)
    {
      screenNumber = USER_SCREEN;
    }
    event = currentScreen.contactButton.getEvent(mouseX, mouseY);
    if (event == CONTACT_BUTTON)
    {
      screenNumber = CONTACT_SCREEN;
    }
    event = currentScreen.writeReviewWidget.getEvent(mouseX, mouseY);
    if(event == WRITE_REVIEW_BUTTON)
    {
      
      screenNumber = WRITE_REVIEW_SCREEN;
      currentScreen = new Screen(color(SKY), WRITE_REVIEW_SCREEN, reviewList);
      
    }
 
  }
  //Hard coded this due to bugs and issues using pictures as clickable widget - Stephen
  if (screenNumber != HOMESCREEN)
  {
    if (mouseX > 0 && mouseX < BORDER_HEIGHT && mouseY > 0 && mouseY < BORDER_HEIGHT)
    {
      screenNumber = HOMESCREEN;
    }
  }
  //Stephen - Cleaned up alot of code here
  //Changed to using current Screen instead of screen 1,2,3.....1000 etc avoid code duplication & makes more sense

  for (int i = 0; i < currentScreen.movingWidgets.size(); i++)
  {
    Widget currentWidget = (Widget)currentScreen.movingWidgets.get(i);
    event = currentWidget.getEvent(mouseX, mouseY);
    switch(event)
    {
    case LOAD_BUSINESS_BUTTON:
      //Stephen - don't understand why theres two event buttons thta both do the same thing ( each widget triggers the same button, EVENT_1 was never used)
      //((ReviewWidget)currentWidget).setFullScreen();
      screenNumber = REVIEW_SCREEN;
      screen3 = new Screen(0, REVIEW_SCREEN, currentWidget.getReview());
      currentScreen = screen3;
      break;
    case HOME_BUSINESS_BUTTON:  //Chris -27/03/18, added this to switch to searchresult screen of business name if a business is selected from the home screen.
      screenNumber=SEARCH_RESULT_SCREEN;
      currentSearch = currentQuery.findBusiness(currentWidget.getLabel());
      screen2 = new Screen(color(SKY), SEARCH_RESULT_SCREEN, currentSearch);
      currentScreen = screen2;  
      break;
    case USER_WIDGET:
      screenNumber = USER_REVIEW_SCREEN;
      currentSearch = currentQuery.findUserByName(currentWidget.getLabel());
      screen5 = new Screen (color(SKY), USER_REVIEW_SCREEN, currentSearch);
      currentScreen = screen5;  // hannah - making sure when the usernames are clicked the right reviews come up
    }
  }

  for (int i = 0; i < currentScreen.staticWidgets.size(); i++)
  {
    Widget currentWidget = (Widget) currentScreen.staticWidgets.get(i);
    event = currentWidget.getEvent(mouseX, mouseY);
    switch(event)
    {

    case EVENT_BUTTON_TOP_RATED_HOMESCREEN:
      //screen3 = new Screen(color(255), LOAD_BUSINESS_BUTTON, reviewList);
      //screenNumber = LOAD_BUSINESS_BUTTON;
      //currentQuery.sortByDate();
      currentScreen.sortWidgetsByAverageStarRatings();
      //reviewList = currentScreen.sortTopRated(reviewList);
      break;
    case BACK_BUTTON:
      if (screenNumber == REVIEW_SCREEN)
      {
        screenNumber = SEARCH_RESULT_SCREEN;
      } else if (screenNumber == SEARCH_RESULT_SCREEN)
      {
        screenNumber = HOMESCREEN;
      } else if (screenNumber == USER_SCREEN)
      {
        screenNumber = HOMESCREEN;
      } else if (screenNumber == USER_REVIEW_SCREEN) //hannah creating back button for user screens
      {
        screenNumber = USER_SCREEN;
      } else if (screenNumber == CONTACT_SCREEN)
      {
        screenNumber = HOMESCREEN;
      }
      else if (screenNumber ==  WRITE_REVIEW_SCREEN)
      {
        screenNumber = HOMESCREEN;
      }

      break;

    case HOME_BUTTON :
      screenNumber= HOMESCREEN;
      break;

    case USER_BUTTON:
      //screen4 = new Screen(color(255), USER_SCREEN, reviewList );
      screenNumber = USER_SCREEN;
      break;

    case CLICK_TO_ENTER:
      screenNumber = HOMESCREEN;
      break;

      //case MENU_BUTTON:
      // currentScreen.menuWidgets();   //Hannah - creating drop down menu
      // break;

    case CONTACT_BUTTON:
      screenNumber = CONTACT_SCREEN;
      break;
    case EVENT_BUTTON_TOP_RATED:
      currentScreen.sortWidgetsByStarRatings();
      break;
    case FIVE_STAR_WIDGET_BUTTON:
    FiveStarWidget starsWidget = (FiveStarWidget) currentScreen.staticWidgets.get(i);
    starsWidget.pressStars();
    break;
      /*
    case NEXT_BUTTON:                                //hannah here, having an issue implementing a next button function to see the next review. Null pointer exception keeps occuring.
       for (int j = 0; j < reviewList.size(); j++)
       {
       
       reviewList.get(j).getBusiness_name();
       if (review.getBusiness_name() == reviewList.get(j).getBusiness_name())
       {
       reviewList.get(j).toString();
       println(reviewList.get(j));
       }
       }
       
       break;
       */
    }
  }

  for (int i = 0; i < currentScreen.TextWidgetList.size(); i++) {
    TextWidget theWidget = (TextWidget)currentScreen.TextWidgetList.get(i);
    event = theWidget.getEvent(mouseX, mouseY);
    if (event== TEXT_WIDGET) {
      focus= theWidget;
      theWidget.clearBox();
      break;
    } else {
      focus=null;
    }
  }
}


void mouseMoved()
{
  int event;
  for (int i = 0; i < currentScreen.movingWidgets.size(); i++) 
  {
    Widget currentWidget = (Widget) currentScreen.movingWidgets.get(i);
    event = currentWidget.getEvent(mouseX, mouseY);
    if (event > 0)
    {
      currentWidget.strokeColor = 255;
    } else if (event == 0)
    {
      currentWidget.strokeColor = 0;
    }
    if (event==HOME_BUSINESS_BUTTON) {
      //piechart = new Piechart(SCREEN_WIDTH*1/7, SCREEN_HEIGHT/2, 200, currentQuery.starsForBusiness(currentWidget.getLabel()), true, "AVERAGE STAR RATING", currentWidget.getLabel());
      currentScreen.changeCurrentBarchart(currentQuery.starsForBusiness(currentWidget.getLabel()));
    }
  }
  for (int i = 0; i < currentScreen.staticWidgets.size(); i++) 
  {
    try {
      FiveStarWidget currentWidget = (FiveStarWidget) currentScreen.staticWidgets.get(i);
      event = currentWidget.getEvent(mouseX, mouseY);
      if (event == FIVE_STAR_WIDGET_BUTTON) {
        currentWidget.highlightStars();
      }
    } 
    catch (Exception e) {
    }
    Widget currentWidget = (Widget) currentScreen.staticWidgets.get(i);
    event = currentWidget.getEvent(mouseX, mouseY);
    if (event > 0)
    {
      currentWidget.strokeColor = 255;
    } else if (event == 0)
    {
      currentWidget.strokeColor = 0;
    }
  }
}


void keyPressed() {
  if (focus != null) {
    focus.append(key);
    if (key == ENTER&&screenNumber!=WRITE_REVIEW_SCREEN)
    {
      String userInput = currentScreen.TextWidgetList.get(0).getLabel();
      currentSearch = currentQuery.findBusiness(userInput.toLowerCase().trim());
      screen2 = new Screen(color(255), SEARCH_RESULT_SCREEN, currentSearch);
      screenNumber = SEARCH_RESULT_SCREEN;
      //Stephen - Create a screen with passing in currentSearch arraylist
      //Set newly created screen to current screen
      //Used passed arraylist to make widgets corresponding to each review
      //When these are clicked make another new screen presenting the review info
    }
  }
}
void loadInData() {
  for (TableRow row : table.rows()) {
    String user_id = row.getString("user_id");
    String user_name = row.getString("user_name");
    String business_id = row.getString("business_id");
    String business_name = row.getString("business_name");
    int stars = row.getInt("stars");
    String date = row.getString("date");                  //This could maybe be parsed as a Date
    String text = row.getString("text");
    int useful = row.getInt("useful");
    int funny = row.getInt("funny");
    int cool = row.getInt("cool");
    Review review = new Review(user_id, user_name, business_id, business_name, stars, date, text, useful, funny, cool);
    reviewList.add(review);
  }
}