part of 'question_answers_bloc.dart';

abstract class QuestionAnswersEvent extends Equatable {
  const QuestionAnswersEvent();

  @override
  List<Object> get props => [];
}

class GetQuestionAnswersRequestEvent extends QuestionAnswersEvent {
  final int questionId;
  const GetQuestionAnswersRequestEvent({required this.questionId});

  @override
  List<Object> get props => [questionId];
}
