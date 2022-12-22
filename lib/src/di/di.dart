import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackexchange_app/src/app/resources/themes/bloc/theme_bloc.dart';
import 'package:stackexchange_app/src/data/providers/local/db/question_local_data_source.dart';
import 'package:stackexchange_app/src/data/providers/local/db/shared_prefrence_db.dart';
import 'package:stackexchange_app/src/data/providers/remote/client/dio_base_client.dart';
import 'package:stackexchange_app/src/data/providers/remote/client/http_client.dart';
import 'package:stackexchange_app/src/data/providers/remote/services/questions_remote_data_source_impl.dart';
import 'package:stackexchange_app/src/data/repositories/questions_repository_impl.dart';
import 'package:stackexchange_app/src/domain/usecases/question/get_all_questions.dart';
import 'package:stackexchange_app/src/domain/usecases/question/get_question_answers.dart';

import '../app/bases/connection_status.dart';
import '../data/providers/remote/services/questions_remote_data_source.dart';
import '../domain/repositories/questions_repository.dart';
import '../presentation/pages/question_answers/bloc/question_answers_bloc.dart';
import '../presentation/pages/questions_list/bloc/questions_list_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> setupDependencies() async {
  await _setupAsyncDependencies();
  _setupSyncDependencies();
}

_setupAsyncDependencies() async {
  // Shared preferences
  injector.registerSingleton(await SharedPreferences.getInstance());
}

void _setupSyncDependencies() {
  // Connection test
  injector.registerSingleton<Connectivity>(Connectivity());

  // Http Client
  injector.registerLazySingleton<IHttpClient>(() => DioBaseClient());

  // Data Source
  injector.registerLazySingleton<IQuestionRemoteDataSource>(
      () => QuestionRemoteDataSource(httpClient: injector<IHttpClient>()));
  injector.registerLazySingleton<IQuestionLocalDataSource>(
      () => SharedPrefrenceDB(sharedPreferences: injector<SharedPreferences>()));

  // Repository
  injector.registerLazySingleton<IQuestionsRepository>(() => QuestionsRepository(
        questionRemoteDataSource: injector<IQuestionRemoteDataSource>(),
        questionLocalDataSource: injector<IQuestionLocalDataSource>(),
      ));

  // Usecases
  injector.registerLazySingleton<GetAllQuestions>(
      () => GetAllQuestions(questionsRepository: injector<IQuestionsRepository>()));
  injector.registerLazySingleton<GetQuestionAnswers>(
      () => GetQuestionAnswers(questionsRepository: injector<IQuestionsRepository>()));

  // Bloc
  injector.registerLazySingleton<ThemeBloc>(() => ThemeBloc());

  injector.registerLazySingleton<QuestionsListBloc>(() => QuestionsListBloc(
        getAllQuestions: injector<GetAllQuestions>(),
      ));

  injector.registerFactory<QuestionAnswersBloc>(
      () => QuestionAnswersBloc(getQuestionAnswers: injector<GetQuestionAnswers>()));
}
