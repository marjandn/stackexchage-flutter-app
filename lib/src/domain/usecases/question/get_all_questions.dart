import 'package:either_dart/either.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../../data/providers/remote/params/question_param.dart';
import '../../entities/question.dart';
import '../../repositories/questions_repository.dart';

class GetAllQuestions extends UseCase<Question, QuestionsParam> {
  IQuestionsRepository questionsRepository;

  GetAllQuestions({required this.questionsRepository});

  @override
  Future<Either<Failur, Question>> call(QuestionsParam params) async =>
      await questionsRepository.getAllQuestions(questionsParam: params);
}
