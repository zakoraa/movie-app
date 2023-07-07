// import 'package:get/get.dart';
// import 'package:movieapp/movie/models/movie_model.dart';
// import 'package:movieapp/movie/repositories/movie_repository.dart';
// import 'package:movieapp/movie/repositories/movie_repository_impl.dart';

// class MovieGetDiscoverController extends GetxController {
//   final MovieRepository movieRepository;

//   MovieGetDiscoverController(this.movieRepository);

//   var _isLoading = false.obs;
//   bool get isLoading => _isLoading.value;
//   final List<Movie> _movies = [];
//   List<Movie> get movies => _movies;

//   void getMovie() async {
//     _isLoading.value = true;
//     final result = await movieRepository.getMovie();

//     movies.add(result);
//   }
// }
