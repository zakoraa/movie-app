// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/serial_model.dart';

class GetMovieSerial {
  Future getData() async {
    try {
      Uri url = Uri.parse(
          "https://streamlinewatch-streaming-guide.p.rapidapi.com/shows");
      final response = await http.get(url, headers: {
        'X-RapidAPI-Key': 'e6d9975bdamsh2d8c07dbe30ea98p155d34jsn752ab57ea078',
        'X-RapidAPI-Host': 'streamlinewatch-streaming-guide.p.rapidapi.com'
      });

      List data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        print("Get Movie Serial Success");
      }
      return MovieSerial.movieSerialFromSnapshot(data);
    } catch (e) {
      print("Get error : ${e.toString()}");
    }
  }
}
