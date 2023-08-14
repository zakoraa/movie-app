import 'package:flutter/cupertino.dart';

abstract class CheckForm {
  static bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  static bool isImageUrl(TextEditingController? textEditingController) {
    return textEditingController!.text.substring(
                textEditingController.text.length - 4,
                textEditingController.text.length) ==
            ".png" ||
        textEditingController.text.substring(
                textEditingController.text.length - 4,
                textEditingController.text.length) ==
            ".jpg" ||
        textEditingController.text.substring(
                textEditingController.text.length - 5,
                textEditingController.text.length) ==
            ".jpeg" ||
        textEditingController.text.substring(
                textEditingController.text.length - 4,
                textEditingController.text.length) ==
            "=CAU" ||
        textEditingController.text.contains(".jpg") ||
        textEditingController.text.contains(".jpeg") ||
        textEditingController.text.contains(".png") ||
        textEditingController.text.contains("image?") ||
        textEditingController.text.contains("images?");
  }
}
