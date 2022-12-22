import 'package:flutter/material.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';

import '../../app/resources/shared/colors.dart';
import '../../app/resources/shared/styles.dart';

class TagItemWidget extends StatelessWidget {
  const TagItemWidget({
    Key? key,
    required this.tagText,
  }) : super(key: key);

  final String tagText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      margin: const EdgeInsets.only(right: 8, top: 8),
      decoration: BoxDecoration(
          borderRadius: AppStyles.borderRaius, color: AppColors.opacityBackgroundColor),
      child: Text(
        tagText,
        style: context.appTheme.textTheme.bodyMedium,
      ),
    );
  }
}
