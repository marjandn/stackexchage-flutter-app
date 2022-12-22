part of 'question_answers_bloc.dart';

abstract class QuestionAnswersState extends Equatable {
  const QuestionAnswersState();

  @override
  List<Object> get props => [];
}

class QuestionAnswersInitial extends QuestionAnswersState {}

class QuestionAnswersLoadingState extends QuestionAnswersState {
  const QuestionAnswersLoadingState();
}

class QuestionAnswersSuccessState extends QuestionAnswersState {
  final List<AnswerItem> answers;
  final bool hasNextPage;
  const QuestionAnswersSuccessState({required this.answers, required this.hasNextPage});

  @override
  List<Object> get props => [answers, hasNextPage];
}

class QuestionAnswersFailedState extends QuestionAnswersState {
  const QuestionAnswersFailedState();
}
