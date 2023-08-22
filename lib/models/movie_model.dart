import 'package:intl/intl.dart';

class Movie {
  final int? id;
  final dynamic rating, releaseDate;
  final String? title, poster, backdrop, overview;
  bool favorite;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.releaseDate,
    this.poster,
    this.backdrop,
    required this.overview,
    required this.favorite,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      rating: NumberFormat("#.#").format(json["vote_average"]),
      releaseDate: json['release_date'] == ""
          ? "2023"
          : json['release_date'].substring(0, 4),
      poster: json['poster_path'] ??
          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
      backdrop: json['backdrop_path'] ??
          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
      overview: json['overview'],
      favorite: false,
    );
  }

  static List<Movie> moviesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Movie.fromJson(data);
    }).toList();
  }
}
