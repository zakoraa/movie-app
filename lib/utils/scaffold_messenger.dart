import 'package:flutter/material.dart';

class ScaffoldMessengerUtils {
  static void showFloatingSnackBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
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
