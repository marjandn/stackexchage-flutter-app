import 'package:stackexchange_app/src/data/models/answers/answers_response.dart';

import '../../../../app/errors/exceptions.dart';
import '../../../models/questions/questions_response.dart';
import '../client/http_client.dart';
import '../params/question_answers_param.dart';
import '../params/question_param.dart';
import 'questions_remote_data_source.dart';

class QuestionRemoteDataSource extends IQuestionRemoteDataSource {
  IHttpClient httpClient;

  QuestionRemoteDataSource({required this.httpClient});

  @override
  Future<QuestionsResponse> getAllQuestions({required QuestionsParam questionsParam}) async {
    try {
      final json =
          await httpClient.getRequest(path: "questions", queryParameters: questionsParam.toJson());

      final QuestionsResponse questionsResponse = QuestionsResponse.fromJson(json);

      return questionsResponse;
    } on ServerException catch (error) {
      throw ServerException(error.errorMessage);
    }
  }

  @override
  Future<AnswersResponse> getQuestionAnswers(
      {required QuestionAnswersParam questionAnswersParam}) async {
    try {
      final json = await httpClient.getRequest(
          path: "questions/${questionAnswersParam.questionId}/answers",
          queryParameters: questionAnswersParam.toJson());

      final AnswersResponse answersResponse = AnswersResponse.fromJson(json);

      return answersResponse;
    } on ServerException catch (error) {
      throw ServerException(error.errorMessage);
    }
  }
}
