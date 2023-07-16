import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextField(
            cursorColor: Colors.grey,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
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
            )),
      ],
    );
  }
}
