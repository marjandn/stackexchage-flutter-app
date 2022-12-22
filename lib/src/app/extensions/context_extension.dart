import 'package:flutter/material.dart';

extension ShowSnack on BuildContext {
  showSnackbar([String snackMessage = ""]) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Text(snackMessage)),
      );
}
