import 'package:get/get.dart';
import 'package:movieapp/movie/models/movie_model.dart';

import '../api/get_movie.dart';

class MovieController extends GetxController {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "0a84c7b7058bb847517847c7a87debae";
  static const String imageUrl = "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg";
  static const String imageUrlOriginal = "https://image.tmdb.org/t/p/original";
  static const String imageUrlW500 = "https://image.tmdb.org/t/p/w500";

  RxList<Movie> listMovie = <Movie>[].obs;
  RxList<Movie> trendingListMovie = <Movie>[].obs;
  RxList<Movie> carouselSliderListMovie = <Movie>[].obs;
  GetMovie getMovie = GetMovie();
  var isLoading = true.obs;

  Future<void> getData() async {
    var data = await getMovie.getData();
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
