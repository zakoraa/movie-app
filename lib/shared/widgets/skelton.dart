import 'package:flutter/material.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({super.key, required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}