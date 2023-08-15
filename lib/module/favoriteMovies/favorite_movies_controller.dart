// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:movieapp/services/favorite_movies_services.dart';

class FavoriteMoviesController extends GetxController {
  FavoriteMoviesServices favoriteMoviesServices =
      Get.put(FavoriteMoviesServices());
  List movieIdList = [];

  Future<void> addFavoriteMovies(String userId, dynamic movieId) async {
    movieIdList.add(movieId);
    final data = favoriteMoviesServices.addFavoriteMovies(userId, movieIdList);
    print("data : $data");
    print(movieIdList);
  }
}
