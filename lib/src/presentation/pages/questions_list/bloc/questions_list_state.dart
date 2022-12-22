part of 'questions_list_bloc.dart';

abstract class QuestionsListState extends Equatable {
  const QuestionsListState();

  @override
  List<Object> get props => [];
}

class QuestionsListLoadingState extends QuestionsListState {
  const QuestionsListLoadingState();
}

class QuestionsListSuccessState extends QuestionsListState {
  final List<QuestionItem> questions;
  final bool hasNextPage;
  const QuestionsListSuccessState({required this.questions, required this.hasNextPage});

  @override
  List<Object> get props => [questions, hasNextPage];
}

class QuestionsListFailedState extends QuestionsListState {
  final String errorMessage;
  const QuestionsListFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
