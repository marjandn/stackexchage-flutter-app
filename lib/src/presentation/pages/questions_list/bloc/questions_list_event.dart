part of 'questions_list_bloc.dart';

abstract class QuestionsListEvent extends Equatable {
  const QuestionsListEvent();

  @override
  List<Object> get props => [];
}

class GetQuestionsListRequestEvent extends QuestionsListEvent {
  const GetQuestionsListRequestEvent();
}
