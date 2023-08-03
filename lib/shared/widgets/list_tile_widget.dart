// ignore_for_file: prefer_typing_uninitialized_variables, implementation_imports, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movieapp/module/movieDetails/view/movie_details_view.dart';
import '../utils/image_url_api.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.listMovie});

  final List listMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
            children: listMovie.map((movie) {
          return GestureDetector(
            onTap: () =>
                Get.to(()=>MovieDetailsView(movie: movie),transition: Transition.fade,popGesture: true),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: Get.size.width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(46, 144, 143, 143),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  height: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${ImageUrlApi.imageUrlW500}${movie.poster}",
                                      height: 120,
                                      loadingBuilder: (context, child,
                                              loadingProgress) =>
                                          (loadingProgress == null)
                                              ? child
                                              : SizedBox(
                                                  height: Get.size.height,
                                                  child: Center(
                                                    child: LoadingAnimationWidget
                                                        .horizontalRotatingDots(
                                                            color: Colors.white,
                                                            size: 40),
                                                  ),
                                                ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 30, left: 30),
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      "${movie.title}",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 30),
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      movie.releaseDate!,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                      (movie.rating == "")
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Container(
                                height: 50,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFB039),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      Text(
                                        "${movie.rating}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
