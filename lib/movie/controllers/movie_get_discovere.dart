import 'package:get/get.dart';
import 'package:movieapp/movie/models/movie_model.dart';

import '../api/get_movie.dart';

class MovieController extends GetxController {
  RxList<Movie> listMovie = <Movie>[].obs;
  GetMovie getMovie = GetMovie();
  var isLoading = true.obs;

  Future<void> getData() async {
  var data = await getMovie.getData();
  if (data != null) {
    listMovie.value = data;
  }
  isLoading.value = false;
}

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
