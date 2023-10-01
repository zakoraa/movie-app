import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/movieDetails/controller/movie_details_controller.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/app_bar_custom.dart';
import 'package:movieapp/shared/widgets/list_tile_widget.dart';

class FavoriteMoviesView extends StatelessWidget {
  const FavoriteMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.find<MovieDetailsController>();
    return Scaffold(
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ScaffoldBackgroundTemplate(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(children: [
                          SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Column(
                    children: [
                      movieDetailsController.favMovies.isNotEmpty
                          ? ListTileWidget(
                              listMovie: movieDetailsController.favMovies)
                          : const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "No Movies",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "normal",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
                          ),
                          AppBarCustom(
                onTap: () => Get.back(),
                title: "Your Favorite Movies",
                fontSize: 18,
                          )
                        ]),
              ))),
    );
  }
}
