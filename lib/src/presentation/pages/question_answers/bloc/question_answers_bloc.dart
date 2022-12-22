import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stackexchange_app/src/data/providers/remote/params/question_answers_param.dart';
import 'package:stackexchange_app/src/domain/entities/answer.dart';
import 'package:stackexchange_app/src/domain/usecases/question/get_question_answers.dart';

part 'question_answers_event.dart';
part 'question_answers_state.dart';

class QuestionAnswersBloc extends Bloc<QuestionAnswersEvent, QuestionAnswersState> {
  final GetQuestionAnswers getQuestionAnswers;

  QuestionAnswersBloc({required this.getQuestionAnswers}) : super(QuestionAnswersInitial()) {
    on<GetQuestionAnswersRequestEvent>((event, emit) async {
      emit(const QuestionAnswersLoadingState());
      var answersRes = await getQuestionAnswers
          .call(QuestionAnswersParam(questionId: event.questionId, page: 1));

      answersRes.fold(
          (left) => emit(const QuestionAnswersFailedState()),
          (right) => emit(
              QuestionAnswersSuccessState(answers: right.answerItems, hasNextPage: right.hasMore)));
    });
  }
}
