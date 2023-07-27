import 'package:flutter/material.dart';

class ScaffoldMessengerUtils {
  static void showFloatingSnackBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.amber,
    ));
  }
}
