// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetMovie {
  String? apiKey = dotenv.env['MOVIE_API_KEY'];
  Future getData() async {
    try {
      Uri url = Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final response = await http.get(url,
          headers: {'accept': 'application/json', 'Authorization': '$apiKey'});

      Map data = jsonDecode(response.body);
      List movieData = [];
      for (dynamic i in data['results']) {
        i["favorite"] = false;
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
