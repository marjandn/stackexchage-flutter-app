import 'package:equatable/equatable.dart';

import 'owner.dart';

class Question extends Equatable {
  final List<QuestionItem> questionItems;
  final bool hasMore;
  const Question({
    required this.hasMore,
    required this.questionItems,
  });

  @override
  List<Object?> get props => [questionItems, hasMore];
}

class QuestionItem extends Equatable {
  final List<String> tags;
  final Owner? owner;
  final bool isAnswered;
  final int viewCount;
  final int answerCount;
  final int score;
  final int creationDate;
  final int lastEditDate;
  final int questionId;
  final String link;
  final String title;
  final String body;
  final String bodyMarkdown;

  const QuestionItem({
    required this.tags,
    required this.owner,
    required this.isAnswered,
    required this.viewCount,
    required this.answerCount,
    required this.score,
    required this.creationDate,
    required this.lastEditDate,
    required this.questionId,
    required this.link,
    required this.title,
    required this.bodyMarkdown,
    required this.body,
  });

  @override
  List<Object?> get props => [
        tags,
        owner,
        isAnswered,
        viewCount,
        answerCount,
        score,
        bodyMarkdown,
        body,
        creationDate,
        lastEditDate,
        questionId,
        link,
        title,
      ];
}
