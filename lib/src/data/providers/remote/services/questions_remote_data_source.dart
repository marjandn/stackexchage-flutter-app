import '../../../models/answers/answers_response.dart';
import '../../../models/questions/questions_response.dart';
import '../params/question_answers_param.dart';
import '../params/question_param.dart';

abstract class IQuestionRemoteDataSource {
  Future<QuestionsResponse> getAllQuestions({required QuestionsParam questionsParam});

  Future<AnswersResponse> getQuestionAnswers({required QuestionAnswersParam questionAnswersParam});
}
