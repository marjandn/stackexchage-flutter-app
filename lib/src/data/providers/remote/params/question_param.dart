class QuestionsParam {
  final int page;
  final String order;
  final String sort;
  final String site;
  final filter = "!nOedRLb*BA";

  QuestionsParam({
    required this.page,
    this.order = "desc",
    this.sort = "hot",
    this.site = "stackoverflow",
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'order': order,
        'sort': sort,
        'site': site,
        'filter': filter,
      };
}
