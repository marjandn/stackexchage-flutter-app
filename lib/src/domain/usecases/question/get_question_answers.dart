import 'package:either_dart/either.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../../data/providers/remote/params/question_answers_param.dart';
import '../../entities/answer.dart';
import '../../repositories/questions_repository.dart';

class GetQuestionAnswers extends UseCase<Answer, QuestionAnswersParam> {
  IQuestionsRepository questionsRepository;

  GetQuestionAnswers({required this.questionsRepository});
  @override
  Future<Either<Failur, Answer>> call(QuestionAnswersParam params) async =>
      await questionsRepository.getQuestionAnswers(answersParam: params);
}
