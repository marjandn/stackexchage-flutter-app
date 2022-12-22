// Mocks generated by Mockito 5.3.2 from annotations
// in stackexchange_app/test/data/repositories/question_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:stackexchange_app/src/data/models/answers/answers_response.dart'
    as _i3;
import 'package:stackexchange_app/src/data/models/questions/question_item_response.dart'
    as _i10;
import 'package:stackexchange_app/src/data/models/questions/questions_response.dart'
    as _i2;
import 'package:stackexchange_app/src/data/providers/local/db/question_local_data_source.dart'
    as _i9;
import 'package:stackexchange_app/src/data/providers/remote/params/question_answers_param.dart'
    as _i8;
import 'package:stackexchange_app/src/data/providers/remote/params/question_param.dart'
    as _i7;
import 'package:stackexchange_app/src/data/providers/remote/services/questions_remote_data_source.dart'
    as _i5;
import 'package:stackexchange_app/src/domain/entities/question.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeQuestionsResponse_0 extends _i1.SmartFake
    implements _i2.QuestionsResponse {
  _FakeQuestionsResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAnswersResponse_1 extends _i1.SmartFake
    implements _i3.AnswersResponse {
  _FakeAnswersResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuestion_2 extends _i1.SmartFake implements _i4.Question {
  _FakeQuestion_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IQuestionRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIQuestionRemoteDataSource extends _i1.Mock
    implements _i5.IQuestionRemoteDataSource {
  @override
  _i6.Future<_i2.QuestionsResponse> getAllQuestions(
          {required _i7.QuestionsParam? questionsParam}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllQuestions,
          [],
          {#questionsParam: questionsParam},
        ),
        returnValue:
            _i6.Future<_i2.QuestionsResponse>.value(_FakeQuestionsResponse_0(
          this,
          Invocation.method(
            #getAllQuestions,
            [],
            {#questionsParam: questionsParam},
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.QuestionsResponse>.value(_FakeQuestionsResponse_0(
          this,
          Invocation.method(
            #getAllQuestions,
            [],
            {#questionsParam: questionsParam},
          ),
        )),
      ) as _i6.Future<_i2.QuestionsResponse>);
  @override
  _i6.Future<_i3.AnswersResponse> getQuestionAnswers(
          {required _i8.QuestionAnswersParam? questionAnswersParam}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getQuestionAnswers,
          [],
          {#questionAnswersParam: questionAnswersParam},
        ),
        returnValue:
            _i6.Future<_i3.AnswersResponse>.value(_FakeAnswersResponse_1(
          this,
          Invocation.method(
            #getQuestionAnswers,
            [],
            {#questionAnswersParam: questionAnswersParam},
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.AnswersResponse>.value(_FakeAnswersResponse_1(
          this,
          Invocation.method(
            #getQuestionAnswers,
            [],
            {#questionAnswersParam: questionAnswersParam},
          ),
        )),
      ) as _i6.Future<_i3.AnswersResponse>);
}

/// A class which mocks [IQuestionLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIQuestionLocalDataSource extends _i1.Mock
    implements _i9.IQuestionLocalDataSource {
  @override
  _i6.Future<void> saveQuestionList(
    _i2.QuestionsResponse? questions,
    int? page,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveQuestionList,
          [
            questions,
            page,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [QuestionsResponse].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuestionsResponse extends _i1.Mock implements _i2.QuestionsResponse {
  @override
  set items(List<_i10.QuestionItemResposne>? _items) => super.noSuchMethod(
        Invocation.setter(
          #items,
          _items,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set hasMore(bool? _hasMore) => super.noSuchMethod(
        Invocation.setter(
          #hasMore,
          _hasMore,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set quotaMax(int? _quotaMax) => super.noSuchMethod(
        Invocation.setter(
          #quotaMax,
          _quotaMax,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set quotaRemaining(int? _quotaRemaining) => super.noSuchMethod(
        Invocation.setter(
          #quotaRemaining,
          _quotaRemaining,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Question toEntity() => (super.noSuchMethod(
        Invocation.method(
          #toEntity,
          [],
        ),
        returnValue: _FakeQuestion_2(
          this,
          Invocation.method(
            #toEntity,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeQuestion_2(
          this,
          Invocation.method(
            #toEntity,
            [],
          ),
        ),
      ) as _i4.Question);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}