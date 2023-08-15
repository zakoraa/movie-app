// ignore_for_file: unused_local_variable,  avoid_print

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FavoriteMoviesServices {
  Future<void> addFavoriteMovies(String idToken, String movieId) async {
    String? apiKey = dotenv.env['FIREBASE_API_KEY'];

    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=$apiKey");

    var response = await http.post(url,
        body: jsonEncode({"idToken": idToken, "movieId": movieId}));

    final data = jsonDecode(response.body);
    print("data: $data");
    return data;
  }
}
