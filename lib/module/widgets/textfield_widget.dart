import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Username",
              style: TextStyle(
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
              style: const TextStyle(
                  color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                fillColor: const Color.fromARGB(
                    67, 158, 158, 158),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              )),
        ],
      ),
    );
  }
}
