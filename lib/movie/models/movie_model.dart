class MovieResponse {
  final int page, totalPage, totalResults;
  final List<Movie> results;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPage,
    required this.totalResults,
  });

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
      page: json['page'],
      results: List<Movie>.from(json['results'].map((x)=> Movie.fromMap(x))),
      totalPage: json['total_pages'],
      totalResults: json['total_results']
      );
}

class Movie {
  final int? id;
  final double? rating;
  final String? title, poster, backdrop, releaseDate, overview;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.releaseDate,
    this.poster,
    this.backdrop,
    required this.overview,
  });

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      rating: json['vote_avarage'],
      releaseDate: json['release_date'],
      poster: json['poster_path'] ?? '',
      backdrop: json['backdrop_path'] ?? '',
      overview: json['overview']);
}
