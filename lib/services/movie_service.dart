// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie_model.dart';

class GetMovie {
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
      List movieData = [];

      for (dynamic i in data['results']) {
        movieData.add(i);
      }
      if (movieData.isNotEmpty) {
        print("Get Movie Success");
      }
      return Movie.moviesFromSnapshot(movieData);
    } catch (e) {
      print("Get error: ${e.toString()}");
    }
  }
}
