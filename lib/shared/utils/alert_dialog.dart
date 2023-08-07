import 'package:flutter/material.dart';

abstract class AlertDialogUtils {
  static void showDialogUtils(BuildContext context,
      {required title, required actions}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: title, actions: actions);
        });
  }
}
