import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/themes/bloc/theme_bloc.dart';
import '../resources/themes/themes_manager.dart';

extension ThemeExtension on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  ThemeData get theme => (watch<ThemeBloc>().state is LightThemeState)
      ? ThemesManager.light().getTheme()
      : ThemesManager.dark().getTheme();
}
