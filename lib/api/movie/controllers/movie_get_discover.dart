import 'package:get/get.dart';
import 'package:movieapp/api/movie/models/movie_model.dart';

import '../api/get_movie.dart';

class MovieController extends GetxController {
  RxList<Movie> listMovie = <Movie>[].obs;
  RxList<Movie> trendingListMovie = <Movie>[].obs;
  RxList<Movie> carouselSliderListMovie = <Movie>[].obs;
  final GetMovie _getMovie = GetMovie();
  var isLoading = true.obs;

  Future<void> getData() async {
    var data = await _getMovie.getData();
    if (data != null) {
      listMovie.value = data;
      trendingListMovie.value = data;
      carouselSliderListMovie.value = data;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
