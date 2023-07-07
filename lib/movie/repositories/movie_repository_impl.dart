import 'package:dio/dio.dart';
import 'package:movieapp/movie/models/movie_model.dart';
import 'package:movieapp/movie/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;

  MovieRepositoryImpl(this.dio);

  @override
  Future<MovieResponse> getMovie({int? page = 1}) async {
    try {
      final result =
          await dio.get('/discover/movie', queryParameters: {'page': page});

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponse.fromMap(result.data);
        return model;
      }
      throw "Error Get Movie";
    } catch (e) {
      throw e.toString();
    }
  }
}
