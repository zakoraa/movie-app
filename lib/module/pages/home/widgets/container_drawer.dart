import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerDrawer extends StatelessWidget {
  const ContainerDrawer({super.key, required this.icon, required this.text});

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.only(left: 20),
      height: 50,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.amber, width: 1))),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
