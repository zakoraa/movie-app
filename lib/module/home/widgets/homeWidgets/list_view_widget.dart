// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/module/seeAll/view/see_all_view.dart';
import 'package:movieapp/shared/theme/colors.dart';
import '../../../../shared/utils/image_url_api.dart';
import '../../../movieDetails/view/movie_details_view.dart';
import '../../controllers/movie_controller.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget(
      {Key? key, required this.listViewMovieList, required this.text})
      : super(key: key);

  final String text;
  final listViewMovieList;

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    HomeController homeController = Get.put(HomeController());
    List listViewMovie = listViewMovieList.take(10).toList();
    return (movieController.isLoading.value)
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, bottom: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text),
                    GestureDetector(
                      onTap: () => Get.to(
                          () => SeeAllView(
                              movies: listViewMovieList, title: text),
                          transition: Transition.rightToLeft),
                      child: const Text(
                        "See all",
                        style: TextStyle(
                            color: CustomColor.secondaryBgColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "normal",
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
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
                          onTap: () => Get.to(
                              () =>
                                  MovieDetailsView(movie: listViewMovie[index]),
                              transition: Transition.fade,
                              popGesture: true),
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
                                    listViewMovie[index].poster ==
                                            "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png"
                                        ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png"
                                        : "${ImageUrlApi.imageUrlW500}${listViewMovie[index].poster}",
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
                                      fontSize: 13,
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
                                listViewMovie[index].releaseDate,
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
  }
}
