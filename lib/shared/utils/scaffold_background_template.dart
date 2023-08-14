// ignore_for_file: prefer_typing_uninitialized_variables, unused_import, implementation_imports, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScaffoldBackgroundTemplate extends StatelessWidget {
  const ScaffoldBackgroundTemplate({super.key, required this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/Ellipse 2.png",
              scale: 1.5,
            )),
        Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/Ellipse 1.png",
              scale: 1.5,
            )),
        child
      ],
    );
  }
}
