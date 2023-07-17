import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/login/controllers/login_controller.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.suffixIcon = false,
    this.obscureText = false,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool suffixIcon, obscureText;

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() => TextField(
            cursorColor: Colors.grey,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            obscureText: obscureText == false
                ? loginController.obscureText.value
                : !loginController.isVisible.value,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              suffixIcon: suffixIcon == true
                  ? GestureDetector(
                      onTap: () => loginController.visiblePass(),
                      child: Icon(
                        loginController.isVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ))
                  : const SizedBox.shrink(),
              fillColor: const Color.fromARGB(67, 158, 158, 158),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
            )))
      ],
    );
  }
}
