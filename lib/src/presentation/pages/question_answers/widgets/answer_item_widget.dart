import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';

import '../../../../app/resources/shared/colors.dart';
import '../../../shared_components/owner_data_widget.dart';

class AnswerItemWidget extends StatelessWidget {
  const AnswerItemWidget({
    Key? key,
    required this.ownerProfileImage,
    required this.ownerFullName,
    required this.ownerReputation,
    required this.postCreationDate,
    required this.voteCount,
    required this.answerBody,
    required this.isAccepted,
  }) : super(key: key);

  final String ownerProfileImage;
  final String ownerFullName;
  final int ownerReputation;
  final int postCreationDate;
  final int voteCount;
  final String answerBody;
  final bool isAccepted;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OwnerDataWidget(
        ownerProfileImage: ownerProfileImage,
        ownerFullName: ownerFullName,
        postCreationDate: postCreationDate,
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        children: [
          Column(
            children: [
              Text(voteCount.toString(), style: context.appTheme.textTheme.titleMedium),
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                "assets/images/ic_vote.png",
                width: 15,
                color: AppColors.grayColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isAccepted,
                child: Image.asset(
                  "assets/images/ic_check.png",
                  width: 25,
                  color: AppColors.greenColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Html(data: answerBody),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      const Divider(
        color: AppColors.grayColor,
        thickness: 0.5,
      ),
      const SizedBox(
        height: 16,
      ),
    ]);
  }
}
