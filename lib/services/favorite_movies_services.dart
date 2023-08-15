// ignore_for_file: unused_local_variable,  avoid_print

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FavoriteMoviesServices {
  String? apiKey = dotenv.env['FAV_MOVIES_API_KEY'];
  addFavoriteMovies(String userId, List movieIdList) async {
    print("movie List : $movieIdList");
    print("user id : $userId");
    Uri url = Uri.parse(
        "https://$apiKey.asia-southeast1.firebasedatabase.app/users.json");
    var response = await http.post(url,
        body: jsonEncode({
          "userId": userId, 
          "movieId": movieIdList
          }));

    final data = jsonDecode(response.body);
    print("dataService:$data");
    return data;
  }

  removeFavoriteMovies(String userId, List movieIdList) async {
    print("movie List : $movieIdList");
    print("user id : $userId");
    Uri url = Uri.parse(
        "https://$apiKey.asia-southeast1.firebasedatabase.app/users.json");
    var response = await http.post(url,
        body: jsonEncode({
          "userId": userId, 
          "movieId": movieIdList
          }));

    final data = jsonDecode(response.body);
    print("dataService:$data");
    return data;
  }
}
