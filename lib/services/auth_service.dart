// ignore_for_file: avoid_init_to_null, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  String? apiKey = dotenv.env['FIREBASE_API_KEY'];
  String? acceptedPassword;
  login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${apiKey}");
    var response = await http.post(url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));

    var data = json.decode(response.body);
    acceptedPassword = password;
    print("data : $data");
    print("id : ${data["idToken"]}");
    return data;
  }

  signup(String username, String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
          "displayName": username,
          "returnSecureToken": true
        }));

    var data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }
}
