// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/movie/models/movie_model.dart';

class GetMovie {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "0a84c7b7058bb847517847c7a87debae";
  static const String imageUrl = "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg";
  static const String imageUrlOriginal = "https://image.tmdb.org/t/p/original/";
  static const String imageUrlW500 = "https://image.tmdb.org/t/p/w500/";

  Future getData() async {
    try {
      Uri url = Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final response = await http.get(url, headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTg0YzdiNzA1OGJiODQ3NTE3ODQ3YzdhODdkZWJhZSIsInN1YiI6IjY0MmY5OWEzMzEwMzI1MDEwMzZlMzQ1NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oBf0vLc9uqaj2zijzbWq7Jiz5NI-V0peRxph3Up4YtE'
      });

      Map data = jsonDecode(response.body);
      // print(data);
      List _temp = [];

      for (dynamic i in data['results']) {
        _temp.add(i);
      }
      print(_temp);
      return Movie.moviesFromSnapshot(_temp);
    } catch (e) {
      print("Get error bang: ${e.toString()}");
    }
  }
}
