import 'package:flutter/material.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.transparent, Colors.white],
              ).createShader(bounds);
            },
            child: Image.network(
              "https://images.bisnis.com/upload/img/Spider-Man_Across_the_SpiderVerse_rekomendasi_film_1.jpg",
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
