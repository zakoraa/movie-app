import 'package:get/get.dart';

class MovieDetailsController extends GetxController {
  RxBool isLiked = false.obs;
  List favMovies = [];

  void handleLike(dynamic movie) {
    isLiked.value = !isLiked.value;
    movie.favorite = isLiked.value;

    if (isLiked.value) {
      favMovies.add(movie);
    } else {
      favMovies.remove(movie);
    }
    Get.forceAppUpdate();
  }
}
