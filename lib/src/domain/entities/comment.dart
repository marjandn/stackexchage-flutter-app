import 'package:equatable/equatable.dart';

import 'owner.dart';

class Comment extends Equatable {
  final Owner owner;
  final bool edited;
  final int score;
  final int creationDate;
  final String bodyMarkdown;
  final String body;

  const Comment({
    required this.owner,
    required this.edited,
    required this.score,
    required this.creationDate,
    required this.bodyMarkdown,
    required this.body,
  });

  @override
  List<Object> get props => [
        owner,
        edited,
        score,
        creationDate,
        bodyMarkdown,
        body,
      ];
}
