class Movie {
  final int? id;
  final dynamic rating;
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        rating: json['vote_average'],
        releaseDate: json['release_date'].substring(0, 4),
        poster: json['poster_path'] ?? '',
        backdrop: json['backdrop_path'] ?? '',
        overview: json['overview']);
  }

  static List<Movie> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }
}
