import 'package:either_dart/either.dart';
import 'package:stackexchange_app/src/app/bases/connection_status.dart';
import 'package:stackexchange_app/src/data/providers/local/db/question_local_data_source.dart';

import '../../app/errors/exceptions.dart';
import '../../app/errors/failure.dart';
import '../../domain/entities/answer.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/questions_repository.dart';
import '../models/questions/questions_response.dart';
import '../providers/remote/params/question_answers_param.dart';
import '../providers/remote/params/question_param.dart';
import '../providers/remote/services/questions_remote_data_source.dart';

class QuestionsRepository extends IQuestionsRepository {
  final IQuestionRemoteDataSource questionRemoteDataSource;
  final IQuestionLocalDataSource questionLocalDataSource;

  QuestionsRepository({
    required this.questionRemoteDataSource,
    required this.questionLocalDataSource,
  });

  @override
  Future<Either<Failur, Question>> getAllQuestions({required QuestionsParam questionsParam}) async {
    if (networkStatus == NetworkStatus.online) {
      try {
        final quesionResponse =
            await questionRemoteDataSource.getAllQuestions(questionsParam: questionsParam);

        questionLocalDataSource.saveQuestionList(quesionResponse, questionsParam.page);

        return Right(quesionResponse.toEntity());
      } on ServerException catch (error) {
        return Left(ServerFailuer(error.errorMessage));
      }
    } else {
      final QuestionsResponse? savedQuestionRespos = questionLocalDataSource.getQuestionList();
      return (savedQuestionRespos != null)
          ? Right(savedQuestionRespos.toEntity())
          : Left(NoDataFailuer());
    }
  }

  @override
  Future<Either<Failur, Answer>> getQuestionAnswers(
      {required QuestionAnswersParam answersParam}) async {
    try {
      final answerResponse =
          await questionRemoteDataSource.getQuestionAnswers(questionAnswersParam: answersParam);

      return Right(answerResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
