import '../../../models/questions/questions_response.dart';

abstract class IQuestionLocalDataSource {
  Future<void> saveQuestionList(QuestionsResponse questions, int page);
  QuestionsResponse? getQuestionList();
}
