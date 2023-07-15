import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/description_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double imgHeight = Get.size.height * 0.8;
    double imgWidth = Get.size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              "https://images.bisnis.com/upload/img/Spider-Man_Across_the_SpiderVerse_rekomendasi_film_1.jpg",
              fit: BoxFit.cover,
              height: imgHeight,
              width: imgWidth,
            ),
            Description(imgHeight: imgHeight)
          ],
        ),
      ),
    );
  }
}
