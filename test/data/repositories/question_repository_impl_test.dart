import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stackexchange_app/src/app/bases/connection_status.dart';
import 'package:stackexchange_app/src/app/errors/exceptions.dart';
import 'package:stackexchange_app/src/app/errors/failure.dart';
import 'package:stackexchange_app/src/data/models/questions/questions_response.dart';
import 'package:stackexchange_app/src/data/providers/local/db/question_local_data_source.dart';
import 'package:stackexchange_app/src/data/providers/remote/params/question_param.dart';
import 'package:stackexchange_app/src/data/providers/remote/services/questions_remote_data_source.dart';
import 'package:stackexchange_app/src/data/repositories/questions_repository_impl.dart';

import 'question_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IQuestionRemoteDataSource>(),
  MockSpec<IQuestionLocalDataSource>(),
  MockSpec<QuestionsResponse>(),
])
void main() {
  late QuestionsRepository questionsRepository;
  late IQuestionRemoteDataSource iQuestionRemoteDataSource;
  late IQuestionLocalDataSource iQuestionLocalDataSource;
  setUpAll(
    () {
      iQuestionLocalDataSource = MockIQuestionLocalDataSource();
      iQuestionRemoteDataSource = MockIQuestionRemoteDataSource();

      questionsRepository = QuestionsRepository(
          questionRemoteDataSource: iQuestionRemoteDataSource,
          questionLocalDataSource: iQuestionLocalDataSource);
    },
  );

  group(
    'getAllQuestions function',
    () {
      test(
        'getAllQuestions, get data from server, send success response',
        () async {
          // arrange
          networkStatus = NetworkStatus.online;
          QuestionsParam fakeParam = QuestionsParam(page: 1);
          QuestionsResponse fakeQuestionResponse = MockQuestionsResponse();
          when(iQuestionRemoteDataSource.getAllQuestions(questionsParam: fakeParam))
              .thenAnswer((_) async => fakeQuestionResponse);

          // act
          var response = await questionsRepository.getAllQuestions(questionsParam: fakeParam);

          //assert
          expect(response.isRight, true);
          verify(fakeQuestionResponse.toEntity()).called(1);
        },
      );

      test(
        'getAllQuestions, get data from server, throw an exception',
        () async {
          // arrange
          networkStatus = NetworkStatus.online;
          QuestionsParam fakeParam = QuestionsParam(page: 1);
          when(iQuestionRemoteDataSource.getAllQuestions(questionsParam: fakeParam))
              .thenThrow(const ServerException("bad network"));

          // act
          var response = await questionsRepository.getAllQuestions(questionsParam: fakeParam);

          //assert
          expect(response.isLeft, true);
          expect(response.left, const ServerFailuer("bad network"));
        },
      );
    },
  );
}
