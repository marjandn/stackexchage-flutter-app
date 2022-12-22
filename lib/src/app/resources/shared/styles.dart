import 'package:flutter/material.dart';
import 'package:stackexchange_app/src/app/extensions/theme_extenesion.dart';

class AppStyles {
  final BuildContext _context;
  AppStyles(this._context);

  static var borderRaius = const BorderRadius.all(Radius.circular(30));

  late BoxDecoration questionContainerBoxDecoration = _questionContainerBoxDecoration();

  BoxDecoration _questionContainerBoxDecoration() => BoxDecoration(
        borderRadius: borderRaius,
        color: _context.appTheme.primaryColor,
      );
}
