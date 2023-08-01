// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/serial_model.dart';

class GetMovieSerial {
  Future getData() async {
    try {
      Uri url = Uri.parse("https://api.themoviedb.org/3/trending/tv/day");
      final response = await http.get(url, headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTg0YzdiNzA1OGJiODQ3NTE3ODQ3YzdhODdkZWJhZSIsInN1YiI6IjY0MmY5OWEzMzEwMzI1MDEwMzZlMzQ1NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oBf0vLc9uqaj2zijzbWq7Jiz5NI-V0peRxph3Up4YtE'
      });
      Map data = jsonDecode(response.body);
      List serialMovieData = [];

      for (dynamic i in data['results']) {
        serialMovieData.add(i);
      }
      if (serialMovieData.isNotEmpty) {
        print("Get Movie Serial Success");
      }
      return MovieSerial.movieSerialFromSnapshot(serialMovieData);
    } catch (e) {
      print("Get error : ${e.toString()}");
    }
  }
}
