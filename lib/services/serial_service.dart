// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/serial_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetMovieSerial {
  String? apiKey = dotenv.env['MOVIE_API_KEY'];
  Future getData() async {
    try {
      Uri url = Uri.parse("https://api.themoviedb.org/3/trending/tv/day");
      final response = await http.get(url,
          headers: {'accept': 'application/json', 'Authorization': '$apiKey'});
      Map data = jsonDecode(response.body);
      List serialMovieData = [];

      for (dynamic i in data['results']) {
        if (i["first_air_date"] == "") {
          continue;
        } else {
          i["favorite"] = false;
          serialMovieData.add(i);
        }
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
