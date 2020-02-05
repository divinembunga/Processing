import java.util.*;
class Query {
  ArrayList<Review> reviewList;

  public Query(ArrayList<Review> reviewList) {
    this.reviewList=reviewList;
  }
  public ArrayList<Review> findBusiness(String businessName) { //Returns an Arraylist of all reviews concerning given business
    businessName = removeUnknownChar(businessName);            //Chris 29/03/18, these lines parse the string so it has no leading or trailing spaces
    businessName = businessName.toLowerCase().trim();          //                , is in lowercase, and they remove any unknown chars. When we use shift to capilalize a letter we get an unknown character.
    ArrayList<Review> returnList = new ArrayList<Review>();
    for (Review review : reviewList) {
      if (review.getBusiness_name().toLowerCase().trim().equals(businessName)) {
        returnList.add(review);
      }
    }
    return returnList;
  }

  public ArrayList<Review> findUserByName(String userName) { //Divine 28/3/18 returns an ArrayList of all reviews concerning given username
    ArrayList<Review> returnList= new ArrayList<Review>();
    for (Review review : reviewList) {
      if (review.getUser_name().equals(userName)) {
        returnList.add(review);
      }
    }
    return returnList;
  }

  public int[] starsForBusiness(String businessName) {
    int[] stars = new int[5];
    ArrayList<Review> businessNameList = findBusiness(businessName); //List of all reviews concerning given business
    for (Review review : businessNameList) {
      if (review.getStars()==5) {           //amount of 5 stars increased
        stars[0]++;
      } else if (review.getStars()==4) {      //amount of 4 stars increased
        stars[1]++;
      } else if (review.getStars()==3) {      //amount of 3 stars increased
        stars[2]++;
      } else if (review.getStars()==2) {      //amount of 2 stars increased
        stars[3]++;
      } else if (review.getStars()==1) {      //amount of 1 stars increased
        stars[4]++;
      }
    }
    return stars;
  }
  /* Chris 
   Added query function which finds all reviews of a given star amount, useful when ordering reviews by stars
   21/03/18
   */
  //Returns an Arraylist of all reviews with a given star value
  //Returns null if starAmount is not in the range{1-5} 
  public ArrayList<Review> findStars(int starAmount) { 
    ArrayList<Review> returnList = new ArrayList<Review>();
    if (starAmount>0&&starAmount<6) {
      for (Review review : reviewList) {
        if (review.getStars()==starAmount) returnList.add(review);
      }
    }
    return returnList;
  }


  // -Chris, 22/03/18, Returns an array with the ratios of how many reviews each business has against the total amount of reviews.
  //This ratio is then converted to degress for use in a piechart
  public int[] businessRatios() {
    ArrayList<String> businessNames = listOfBusinessNames();
    int[] reviewsPerBusiness = new int[businessNames.size()];
    int totalReviews = 0;
    for (int index=0; index<businessNames.size(); index++) {
      ArrayList<Review> temp = findBusiness(businessNames.get(index));
      reviewsPerBusiness[index] = temp.size(); 
      totalReviews += temp.size();
    }
    for (int amount : reviewsPerBusiness) {
      amount = amount*(360/totalReviews);
    }
    return reviewsPerBusiness;
  }
  // -Chris, 22/03/18,Returns an ArrayList<String> of all the different Business names in the data
  public ArrayList<String> listOfBusinessNames() {
    ArrayList<String> businessNames = new ArrayList<String>();
    Boolean matchFound;
    for (Review review : reviewList) {
      matchFound=false;
      String temp = review.getBusiness_name();
      for (String businessName : businessNames) {
        if (businessName.equals(temp)||temp.equals("#N/A")) { //Chris- This creates an ArrayList of the businessNames,
          matchFound = true;                                 //It ignores the business's of name "#N/A" (of which there are 13).
          break;
        }
      }
      if (!matchFound) businessNames.add(temp);
    }
    return businessNames;
  }
   public ArrayList<String>listOfUsernames(){ //Divine-29/3/18 returning an arrayList of all the different usernames in the data       
   ArrayList<String> userNames = new ArrayList<String>();
    Boolean matchFound;
    for (Review review : reviewList) {
      matchFound=false;
      String temp = review.getUser_name();
      for (String userName : userNames) {
        if (userName.equals(temp)) { //Divine- This creates an ArrayList of the userNames,
          matchFound = true;                                 
          break;
        }
      }
      if (!matchFound) userNames.add(temp);
    }
    return userNames;
  }
  public int averageStarsForBusiness(String businessName) {
    int[] totalStars = starsForBusiness(businessName);
    int average = (totalStars[0]+totalStars[1]+totalStars[2]+totalStars[3]+totalStars[4])/totalStars.length;
    return average;
  }
  public void sortByStars() {
    Collections.sort(this.reviewList, new starRatingComparator());
  }
  public void sortByDate() {
    Collections.sort(this.reviewList, new dateComparator());
  }
  public String removeUnknownChar(String text){
    text = text.replace("\uFFFF", "");
    return text;
  }
/*
  public ArrayList<String> reviewsForUserNames()
  {
    ArrayList< String > sortUsernames = new ArrayList<String>();  //hannah here, this isnt finished yet ill come back to it 
    boolean match;
    String temp = review.getUser_name();
    for (int i = 0; i < sortUsernames.size(); i++)
    {
      if (sortUsernames.get(i).equals(review.getUser_name()))
      {
        match=true;
        break;
      }
    }
    if(!match) sortUsernames.add(temp);
  
    return sortUsernames;
  }
  */
  }