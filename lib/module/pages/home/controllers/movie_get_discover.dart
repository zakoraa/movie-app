import 'dart:math';

import 'package:get/get.dart';
import 'package:movieapp/models/movie_model.dart';

import '../../../../services/movie_service.dart';

class MovieController extends GetxController {
  RxList<Movie> listViewMovieList = <Movie>[].obs;
  RxList<Movie> trendingNowMovieList = <Movie>[].obs;
  RxList<Movie> carouselSliderMovieList = <Movie>[].obs;
  final GetMovie _getMovie = GetMovie();
  RxBool isLoading = true.obs;
  Random random = Random();
  Future<void> getData() async {
    var data = await _getMovie.getData();
    if (data.isNotEmpty) {
      listViewMovieList.value = List.from(data);
      listViewMovieList.shuffle(random);
      trendingNowMovieList.value = List.from(data);
      carouselSliderMovieList.value = List.from(data);
      carouselSliderMovieList.shuffle(random);
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
