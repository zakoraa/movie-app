import 'package:get/get.dart';
import 'package:movieapp/module/favoriteMovies/favorite_movies_controller.dart';

class MovieDetailsController extends GetxController {
  FavoriteMoviesController favoriteMoviesController =
      Get.put(FavoriteMoviesController());
  RxBool isLiked = false.obs;

  void handleLike() {
    isLiked.value = !isLiked.value;
  }

  Future<void> addFavoriteMovie(String idToken, dynamic movieId) async {
    if (isLiked.value == true) {
      await favoriteMoviesController.addFavoriteMovies(idToken, movieId);
    }
  }
}
