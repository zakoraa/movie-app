import 'package:get/get.dart';
import 'dart:math';

import '../../../../movie/controllers/movie_get_discover.dart';
import '../../../../movie/models/movie_model.dart';

class HomeController extends GetxController {
  final Random random = Random();

  RxList<Movie> movies = Get.put(MovieController()).trendingListMovie;

  void refreshList(RxList list) {
    list.shuffle(random);
  }

  void sortedByRating() {
    movies.sort((a, b) => b.rating.compareTo(a.rating));
  }
}
