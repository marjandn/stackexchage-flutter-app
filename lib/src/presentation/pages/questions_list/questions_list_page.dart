import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackexchange_app/src/app/bases/connection_status.dart';
import 'package:stackexchange_app/src/app/extensions/context_extension.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';
import 'package:stackexchange_app/src/di/di.dart';
import 'package:stackexchange_app/src/presentation/pages/question_answers/bloc/question_answers_bloc.dart';
import 'package:stackexchange_app/src/presentation/pages/question_answers/question_answers_page.dart';

import '../../../app/resources/shared/colors.dart';
import '../../../app/resources/themes/bloc/theme_bloc.dart';
import '../../../domain/entities/question.dart';
import '../../shared_components/loading_widget.dart';
import 'bloc/questions_list_bloc.dart';
import 'widgets/question_item_widget.dart';

class QuestionsListPage extends StatefulWidget {
  const QuestionsListPage({super.key});

  @override
  State<QuestionsListPage> createState() => _QuestionsListPageState();
}

class _QuestionsListPageState extends State<QuestionsListPage> {
  final ScrollController _scrollController = ScrollController();
  final List<QuestionItem> questions = [];

  @override
  void initState() {
    super.initState();
    context.read<QuestionsListBloc>().add(const GetQuestionsListRequestEvent());

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        context.read<QuestionsListBloc>().add(const GetQuestionsListRequestEvent());
      }
    });
  }

  @override
  void didChangeDependencies() {
    context.read<QuestionsListBloc>().dispose();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.appTheme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "StackExchange",
          style: context.appTheme.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => context.read<ThemeBloc>().add(const ThemeChangePressedEvent()),
          icon: Icon(
            (context.read<ThemeBloc>().state is DarkThemeState)
                ? Icons.sunny
                : Icons.nightlight_round,
            color: (context.read<ThemeBloc>().state is DarkThemeState)
                ? AppColors.goldColor
                : AppColors.blackColor,
          ),
        ),
      ),
      body: BlocBuilder<QuestionsListBloc, QuestionsListState>(
        builder: (context, state) {
          if (state is QuestionsListSuccessState) {
            questions.addAll(state.questions);
            return ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: (state.hasNextPage) ? questions.length + 1 : questions.length,
              itemBuilder: (context, index) => (index < questions.length)
                  ? QuestionItemWidget(
                      question: questions[index],
                      onQuestionClick: () => networkStatus == NetworkStatus.online
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (_) => injector<QuestionAnswersBloc>(),
                                child: QuestionAnswersPage(
                                  question: questions[index],
                                ),
                              ),
                            ))
                          : context.showSnackbar("Please check your internet connection!"),
                    )
                  : const CupertinoActivityIndicator(),
            );
          } else if (state is QuestionsListFailedState) {
            return failedWidget(state.errorMessage);
          }
          return loadingWidget();
        },
      ),
    );
  }
}
