String getDateInDay(int postCreationDate) {
  int dateInDay = DateTime.now()
      .difference(DateTime.fromMillisecondsSinceEpoch(postCreationDate * 1000))
      .inDays;

  return dateInDay == 0 ? "Today" : "$dateInDay days ago";
}
