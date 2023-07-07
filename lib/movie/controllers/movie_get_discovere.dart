import 'package:get/get.dart';
import 'package:movieapp/movie/models/movie_model.dart';

import '../api/get_movie.dart';

class MovieController extends GetxController {
  RxList<Movie> listMovie = <Movie>[].obs;
  RxList<Movie> trendingListMovie = <Movie>[].obs;
  GetMovie getMovie = GetMovie();
  var isLoading = true.obs;

  Future<void> getData() async {
    var data = await getMovie.getData();
    if (data != null) {
      listMovie.value = data;
      trendingListMovie.value = data;
    }
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
