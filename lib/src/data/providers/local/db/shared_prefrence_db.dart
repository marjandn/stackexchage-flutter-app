import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stackexchange_app/src/data/models/answers/answers_response.dart';

import '../../../models/questions/questions_response.dart';
import 'question_local_data_source.dart';

class SharedPrefrenceDB extends IQuestionLocalDataSource {
  final String questionsSavedPageKey = "questions_saved_page_key";
  final String questionsListKey = "questions_list_key";

  final SharedPreferences sharedPreferences;

  SharedPrefrenceDB({required this.sharedPreferences});

  @override
  Future<void> saveQuestionList(QuestionsResponse questions, int page) async {
    String js = "";
    if (page == 1) {
      js = jsonEncode(questions.toJson());
    } else {
      QuestionsResponse? savedQuestion = getQuestionList();
      if (savedQuestion != null) {
        savedQuestion.items!.addAll(questions.items ?? []);
        js = jsonEncode(savedQuestion.toJson());
      }
    }
    await sharedPreferences.setInt(questionsSavedPageKey, page);
    await sharedPreferences.setString(questionsListKey, js);
  }

  @override
  QuestionsResponse? getQuestionList() {
    String js = sharedPreferences.getString(questionsListKey) ?? "";
    if (js.isNotEmpty) {
      return QuestionsResponse.fromJson(jsonDecode(js));
    }
    return null;
  }
}
