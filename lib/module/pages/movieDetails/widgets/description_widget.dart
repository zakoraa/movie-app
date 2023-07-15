import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.imgHeight,
  }) : super(key: key);

  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      height: 1000,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.transparent,
            Colors.transparent,
            // Color.fromARGB(205, 13, 7, 7),
            Color.fromARGB(205, 13, 7, 7),
            Color(0xFF0D0707),
            Color(0xFF0D0707),
          ])),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: imgHeight - 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Spiderman (2023)",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.favorite_outline,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.star,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "8.6",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Spiderman : After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
