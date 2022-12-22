import 'package:either_dart/either.dart';

import '../../app/errors/failure.dart';
import '../../data/providers/remote/params/question_answers_param.dart';
import '../../data/providers/remote/params/question_param.dart';
import '../entities/answer.dart';
import '../entities/question.dart';

abstract class IQuestionsRepository {
  Future<Either<Failur, Question>> getAllQuestions({required QuestionsParam questionsParam});

  Future<Either<Failur, Answer>> getQuestionAnswers({required QuestionAnswersParam answersParam});
}
