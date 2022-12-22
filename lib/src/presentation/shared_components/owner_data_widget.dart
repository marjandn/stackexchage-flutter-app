import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';
import 'package:stackexchange_app/src/app/utility.dart';

import '../../app/resources/shared/colors.dart';

class OwnerDataWidget extends StatelessWidget {
  const OwnerDataWidget({
    Key? key,
    required this.ownerProfileImage,
    required this.ownerFullName,
    required this.postCreationDate,
  }) : super(key: key);

  final String ownerProfileImage;
  final String ownerFullName;
  final int postCreationDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: ownerProfileImage,
                errorWidget: (context, url, error) => Image.asset(
                    "assets/images/profile_placeholder_image.jpg",
                    width: 35,
                    fit: BoxFit.cover),
                placeholder: (context, url) => Image.asset(
                    "assets/images/profile_placeholder_image.jpg",
                    width: 35,
                    fit: BoxFit.cover),
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Text(
                  ownerFullName,
                  style: context.appTheme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Text(getDateInDay(postCreationDate),
            style: context.appTheme.textTheme.titleSmall?.copyWith(color: AppColors.grayColor))
      ],
    );
  }
}
