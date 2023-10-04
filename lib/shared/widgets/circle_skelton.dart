import 'package:flutter/material.dart';

class CircleSkeltonWidget extends StatelessWidget {
  const CircleSkeltonWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }
}
