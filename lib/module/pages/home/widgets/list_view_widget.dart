// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import 'package:movieapp/routes/route_name.dart';
import '../../../../api/imageAPI/image_url_api.dart';
import '../../../../api/movie/controllers/movie_get_discover.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, required this.listViewMovieList})
      : super(key: key);

  final listViewMovieList;

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    HomeController homeController = Get.put(HomeController());
    return Obx(() {
      homeController.randomList(listViewMovieList);
      List listViewMovie = listViewMovieList.take(7).toList();
      return (movieController.isLoading.value)
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 40, bottom: 30),
                  child: Text("For You"),
                ),
                SizedBox(
                  height: 300,
                  width: Get.size.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewMovie.length,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(RouteName.movieDetailsView,
                                arguments: listViewMovie[index]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.network(
                                      "${ImageUrlApi.imageUrlW500}${listViewMovie[index].poster}",
                                      fit: BoxFit.cover,
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
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    "${listViewMovie[index].title}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 232, 232, 232)),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  listViewMovie[index].releaseDate!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            );
    });
  }
}