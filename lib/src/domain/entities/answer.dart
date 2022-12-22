import 'package:equatable/equatable.dart';

import 'comment.dart';
import 'owner.dart';

class Answer extends Equatable {
  final bool hasMore;
  final List<AnswerItem> answerItems;

  const Answer({required this.hasMore, required this.answerItems});

  @override
  List<Object> get props => throw UnimplementedError();
}

class AnswerItem extends Equatable {
  final Owner owner;
  final bool isAccepted;
  final int score;
  final int lastActivityDate;
  final int creationDate;
  final String bodyMarkdown;
  final String body;
  final List<Comment> comments;
  final int lastEditDate;

  const AnswerItem({
    required this.owner,
    required this.isAccepted,
    required this.score,
    required this.lastActivityDate,
    required this.creationDate,
    required this.bodyMarkdown,
    required this.body,
    required this.comments,
    required this.lastEditDate,
  });

  @override
  List<Object> get props => [
        owner,
        isAccepted,
        score,
        lastActivityDate,
        creationDate,
        bodyMarkdown,
        body,
        comments,
        lastEditDate,
      ];
}
