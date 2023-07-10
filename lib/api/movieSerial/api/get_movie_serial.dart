import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/serial_model.dart';

class GetMovieSerial {
  Future getData() async {
    try {
      Uri url = Uri.parse(
          "https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc");
      final response = await http.get(url, headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTg0YzdiNzA1OGJiODQ3NTE3ODQ3YzdhODdkZWJhZSIsInN1YiI6IjY0MmY5OWEzMzEwMzI1MDEwMzZlMzQ1NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oBf0vLc9uqaj2zijzbWq7Jiz5NI-V0peRxph3Up4YtE",
        "accept": "application/json"
      });

      Map data = jsonDecode(response.body);
      List movieSerialData = [];

      for (dynamic i in data["results"]) {
        movieSerialData.add(i);
      }
      if (movieSerialData.length != 0) {
        print("Get Movie Serial Success");
      }
      return MovieSerial.movieSerialFromSnapshot(movieSerialData);
    } catch (e) {
      print("Get error : ${e.toString()}");
    }
  }
}
