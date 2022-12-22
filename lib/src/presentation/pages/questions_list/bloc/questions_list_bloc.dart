import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stackexchange_app/src/app/errors/failure.dart';
import 'package:stackexchange_app/src/data/providers/remote/params/question_param.dart';
import 'package:stackexchange_app/src/domain/entities/question.dart';
import 'package:stackexchange_app/src/domain/usecases/question/get_all_questions.dart';

part 'questions_list_event.dart';
part 'questions_list_state.dart';

class QuestionsListBloc extends Bloc<QuestionsListEvent, QuestionsListState> {
  final GetAllQuestions getAllQuestions;

  bool hasMore = true;
  int _currentPage = 0;

  void dispose() {
    hasMore = true;
    _currentPage = 0;
  }

  QuestionsListBloc({required this.getAllQuestions}) : super(const QuestionsListLoadingState()) {
    on<GetQuestionsListRequestEvent>((event, emit) async {
      if (!hasMore) return;
      var questionRes = await getAllQuestions.call(QuestionsParam(page: ++_currentPage));

      questionRes.fold(
          (left) => emit(QuestionsListFailedState(
              errorMessage: (left is ServerFailuer)
                  ? "Something went wrong in our server, please try again!"
                  : "Please check your internet connection!")), (right) {
        hasMore = right.hasMore;
        emit(QuestionsListSuccessState(questions: right.questionItems, hasNextPage: hasMore));
      });
    });
  }
}
