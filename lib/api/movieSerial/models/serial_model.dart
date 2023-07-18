class MovieSerial {
  int? id;
  String? title, poster, releaseDate, backdrop, overview;
  dynamic rating;

  MovieSerial({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.rating,
    required this.poster,
    required this.backdrop,
    required this.overview,
  });

  factory MovieSerial.fromJson(Map<String, dynamic> json) {
    return MovieSerial(
        id: json["id"],
        title: json["original_name"],
        releaseDate: json["first_air_date"],
        rating: json["vote_average"],
        poster: json["poster_path"]??"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
        backdrop: json["backdrop_path"]??"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
        overview: json["overview"]);
  }

  static List<MovieSerial> movieSerialFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MovieSerial.fromJson(data);
    }).toList();
  }
}
