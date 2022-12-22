import 'package:flutter/material.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';
import 'package:stackexchange_app/src/presentation/shared_components/question_badges_widget.dart';
import 'package:stackexchange_app/src/presentation/shared_components/tag_item_widget.dart';

import '../../../../app/resources/shared/styles.dart';
import '../../../../domain/entities/question.dart';
import '../../../shared_components/owner_data_widget.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({
    Key? key,
    required this.question,
    required this.onQuestionClick,
  }) : super(key: key);

  final QuestionItem question;
  final Function onQuestionClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: context.appTheme.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRaius),
        child: InkWell(
          onTap: () => onQuestionClick(),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              OwnerDataWidget(
                ownerProfileImage: question.owner?.profileImage ?? "",
                ownerFullName: question.owner?.displayName ?? "",
                postCreationDate: question.creationDate,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    question.title,
                    style: context.appTheme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              QuestionBadgesWidget(
                viewsCount: question.viewCount,
                answeredCount: question.answerCount,
                votesCount: question.viewCount,
                hasAnswered: question.isAnswered,
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: question.tags
                    .map(
                      (e) => TagItemWidget(tagText: e),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 4,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
