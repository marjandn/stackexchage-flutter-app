class QuestionAnswersParam {
  final String filter = "!*MjkmyT9x3lOyavq";
  final int questionId;
  final int page;
  final String order;
  final String sort;
  final String site;

  QuestionAnswersParam({
    required this.questionId,
    required this.page,
    this.order = "desc",
    this.sort = "activity",
    this.site = "stackoverflow",
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'filter': filter,
        'order': order,
        'sort': sort,
        'site': site,
      };
}
