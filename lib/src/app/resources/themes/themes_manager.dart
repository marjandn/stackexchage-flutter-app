import 'package:flutter/material.dart';

import '../shared/colors.dart';

class ThemesManager {
  late final Color primaryColor;
  late final Color backgroundColor;
  late final IconThemeData primaryIconTheme;

  late final TextTheme textTheme;

  ThemesManager.light()
      : primaryColor = AppColors.primaryColor,
        backgroundColor = AppColors.backgroundLightColor,
        textTheme = Typography.blackCupertino,
        primaryIconTheme = const IconThemeData(color: AppColors.blackColor, size: 25);

  ThemesManager.dark()
      : primaryColor = AppColors.primaryColorDark,
        backgroundColor = AppColors.backgroundDarkColor,
        textTheme = Typography.whiteCupertino,
        primaryIconTheme = const IconThemeData(color: AppColors.whiteColor, size: 25);

  ThemeData getTheme() => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: textTheme,
        dividerColor: AppColors.grayColor,
        splashColor: AppColors.grayColor,
        primaryIconTheme: primaryIconTheme,
      );
}
