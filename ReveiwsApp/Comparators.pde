import java.util.Comparator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
public static class starRatingComparator implements Comparator<Review> {
  public int compare(Review review1, Review review2) {
    int returnValue=0;
    if (review1.getStars()<review2.getStars()) returnValue=1;
    else if (review1.getStars()==review2.getStars()) returnValue=0;
    else if (review1.getStars()>review2.getStars()) returnValue=-1;
    return returnValue;
  }
}
public static class starRatingWidgetComparator implements Comparator<Widget> {
  public int compare(Widget widget1, Widget widget2) {
    if(widget1.getReview()==null&&widget2.getReview()!=null) return 1;
    else if(widget1.getReview()==null&&widget2.getReview()==null) return 0;
    else if(widget1.getReview()!=null&&widget2.getReview()==null) return -1;
    int returnValue=0;
    try {
      if (widget1.getReview().getStars()<widget2.getReview().getStars())returnValue=1;
      else if (widget1.getReview().getStars()==widget2.getReview().getStars())returnValue=0;
      else if (widget1.getReview().getStars()>widget2.getReview().getStars())returnValue=-1;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return returnValue;
  }
}
public static class dateComparator implements Comparator<Review> {
  public int compare(Review review1, Review review2) {
    int returnValue=0;
    DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
    try {
      Date date1 = formatter.parse(review1.getDate());
      Date date2 = formatter.parse(review2.getDate());
      int temp = (int)date1.compareTo(date2);
      if (temp<0) returnValue=-1;
      else if (temp==0) returnValue=0;
      else if (temp>0) returnValue=1;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return returnValue;
  }
}
public static class averageStarRatingWidgetComparator implements Comparator<Widget> {
  private Query query;
  averageStarRatingWidgetComparator(Query query) {
    this.query = query;
    if (query==null) println("y");
  }
  public int compare(Widget widget1, Widget widget2) {
    int returnValue=0;
    try {
      if (query.averageStarsForBusiness(widget1.getLabel())<query.averageStarsForBusiness(widget2.getLabel()))returnValue=1;
      else if (query.averageStarsForBusiness(widget1.getLabel())==query.averageStarsForBusiness(widget2.getLabel()))returnValue=0;
      else if (query.averageStarsForBusiness(widget1.getLabel())>query.averageStarsForBusiness(widget2.getLabel()))returnValue=-1;
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
    return returnValue;
  }
}