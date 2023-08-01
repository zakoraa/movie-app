import 'package:get/get.dart';
import 'package:movieapp/models/movie_model.dart';

import '../../../../services/movie_service.dart';

class MovieController extends GetxController {
  RxList<Movie> listViewMovieList = <Movie>[].obs;
  RxList<Movie> trendingNowMovieList = <Movie>[].obs;
  RxList<Movie> carouselSliderMovieList = <Movie>[].obs;
  final GetMovie _getMovie = GetMovie();
  RxBool isLoading = true.obs;

  Future<void> getData() async {
    var data = await _getMovie.getData();
    if (data.isNotEmpty) {
      listViewMovieList.value = data;
      trendingNowMovieList.value = data;
      carouselSliderMovieList.value = data;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
