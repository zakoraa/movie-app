import 'package:movieapp/movie/models/movie_model.dart';

abstract class MovieRepository {
  Future<MovieResponse> getMovie({int? page = 1});
}
