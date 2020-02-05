class Review {
  String user_id;
  String user_name;
  String business_id;
  String business_name;
  int stars;
  String date;
  String review;
  int useful;
  int funny;
  int cool;

  Review(String user_id, String user_name, String business_id, String business_name, int stars, String date, String review, int useful, int funny, int cool) {
    this.user_id = user_id;
    this.user_name = user_name;
    this.business_id = business_id;
    this.business_name = business_name;
    this.stars = stars;
    this. date = date;
    this.review = review;
    removeNewLines();      //Chris 27/03/2018, removing new lines from text of review.
    this.useful = useful;
    this.funny = funny;
    this.cool = cool;
  }
  public String toString() {
    return "user id: " + user_id + "\nuser name: " + user_name + "\nbusiness id: " + business_id + "\nbusiness name: " 
      + business_name + "\nstars: " + stars + "\ndate: " + date + "\nreview: " + review + "\nuseful: " + useful 
      + "\nfunny: " + funny + "\ncool: " + cool;
  }
  public String getUser_id() {
    return user_id;
  }
  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }
  public String getUser_name() {
    return user_name;
  }
  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }
  public String getBusiness_id() {
    return business_id;
  }
  public void setBusiness_id(String business_id) {
    this.business_id = business_id;
  }
  public String getBusiness_name() {
    return business_name;
  }
  public void setBusiness_name(String business_name) {
    this.business_name = business_name;
  }
  public int getStars() {
    return stars;
  }
  public void setStars(int stars) {
    this.stars = stars;
  }
  public String getDate() {
    return date;
  }
  public void setDate(String date) {
    this.date = date;
  }
  public String getReview() {
    return review;
  }
  public void setReview(String review) {
    this.review = review;
  }
  public int getUseful() {
    return useful;
  }
  public void setUseful(int useful) {
    this.useful = useful;
  }
  public int getFunny() {
    return funny;
  }
  public void setFunny(int funny) {
    this.funny = funny;
  }
  public int getCool() {
    return cool;
  }
  public void setCool(int cool) {
    this.cool = cool;
  }
  //Chrs - 27/03/18, added function to remove new lines from text of reviews.
  public void removeNewLines() {
    this.review = this.review.replace("\n", "").replace("\r", "");
  }
}