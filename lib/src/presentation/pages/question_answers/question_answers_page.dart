import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';

import '../../../app/resources/shared/styles.dart';
import '../../../domain/entities/question.dart';
import '../../shared_components/loading_widget.dart';
import '../../shared_components/owner_data_widget.dart';
import '../../shared_components/question_badges_widget.dart';
import '../../shared_components/tag_item_widget.dart';
import 'bloc/question_answers_bloc.dart';
import 'widgets/answer_item_widget.dart';

class QuestionAnswersPage extends StatefulWidget {
  const QuestionAnswersPage({super.key, required this.question});
  final QuestionItem question;
  @override
  State<QuestionAnswersPage> createState() => _QuestionAnswersPageState();
}

class _QuestionAnswersPageState extends State<QuestionAnswersPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<QuestionAnswersBloc>()
        .add(GetQuestionAnswersRequestEvent(questionId: widget.question.questionId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.appTheme.scaffoldBackgroundColor,
        title: Text(
          "Answers",
          style: context.appTheme.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.appTheme.iconTheme.color,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: AppStyles(context).questionContainerBoxDecoration,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              OwnerDataWidget(
                ownerProfileImage: widget.question.owner?.profileImage ?? "",
                ownerFullName: widget.question.owner?.displayName ?? "",
                postCreationDate: widget.question.creationDate,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.question.title,
                    style: context.appTheme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Html(data: widget.question.body),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              QuestionBadgesWidget(
                viewsCount: widget.question.viewCount,
                answeredCount: widget.question.answerCount,
                votesCount: widget.question.viewCount,
                hasAnswered: widget.question.isAnswered,
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: widget.question.tags
                    .map(
                      (e) => TagItemWidget(tagText: e),
                    )
                    .toList(),
              )
            ]),
          ),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<QuestionAnswersBloc, QuestionAnswersState>(
            builder: (context, state) {
              if (state is QuestionAnswersSuccessState) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  itemCount: state.answers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => AnswerItemWidget(
                    ownerProfileImage: state.answers[index].owner.profileImage,
                    ownerFullName: state.answers[index].owner.displayName,
                    ownerReputation: state.answers[index].owner.reputation,
                    postCreationDate: state.answers[index].creationDate,
                    voteCount: state.answers[index].score,
                    answerBody: state.answers[index].body,
                    isAccepted: state.answers[index].isAccepted,
                  ),
                );
              } else if (state is QuestionAnswersFailedState) {
                return failedWidget();
              }
              return loadingWidget();
            },
          ),
        ]),
      ),
    );
  }
}
