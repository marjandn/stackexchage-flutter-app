import 'package:flutter/material.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';

import '../../app/resources/shared/colors.dart';
import '../../app/resources/shared/styles.dart';

class QuestionBadgesWidget extends StatelessWidget {
  const QuestionBadgesWidget({
    Key? key,
    required this.viewsCount,
    required this.answeredCount,
    required this.hasAnswered,
    required this.votesCount,
  }) : super(key: key);

  final int viewsCount;
  final int answeredCount;
  final int votesCount;
  final bool hasAnswered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/ic_eye.png",
              width: 15,
              color: AppColors.grayColor,
            ),
            const SizedBox(
              width: 4,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: viewsCount.toString(), style: context.appTheme.textTheme.titleMedium),
              /* TextSpan(
                  text: " views",
                  style:
                      context.appTheme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w200)), */
            ])),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: AppStyles.borderRaius,
              color: hasAnswered ? AppColors.greenColor : Colors.transparent),
          child: Row(
            children: [
              Image.asset(
                "assets/images/ic_answer.png",
                width: 15,
                color: AppColors.grayColor,
              ),
              const SizedBox(
                width: 4,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: answeredCount.toString(),
                    style: context.appTheme.textTheme.titleMedium
                        ?.copyWith(color: hasAnswered ? AppColors.whiteColor : null)),
                TextSpan(
                    text: " Answered",
                    style: context.appTheme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w200)
                        .copyWith(color: hasAnswered ? AppColors.whiteColor : null)),
              ])),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/ic_vote.png",
              width: 15,
              color: AppColors.grayColor,
            ),
            const SizedBox(
              width: 4,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: votesCount.toString(), style: context.appTheme.textTheme.titleMedium),
              /*       TextSpan(
                  text: " Votes",
                  style:
                      context.appTheme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w200)), */
            ])),
          ],
        ),
      ],
    );
  }
}
