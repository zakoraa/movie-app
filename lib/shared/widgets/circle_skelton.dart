import 'package:flutter/material.dart';

class CircleSkeltonWidget extends StatelessWidget {
  const CircleSkeltonWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(size)
      ),
    );
  }
}