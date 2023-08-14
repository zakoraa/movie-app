// ignore_for_file: avoid_init_to_null, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
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

  updateProfilePictureWUrl(String idToken, String profilePicture) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode({
          "idToken": idToken,
          "photoUrl": profilePicture,
          "returnSecureToken": true
        }));

    final data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }

  updateProfilePictureWGallery(String idToken, File profilePicture) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode({
          "idToken": idToken,
          "photoUrl": profilePicture.toString(),
          "returnSecureToken": true
        }));

    final data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }

  updateUsername(String idToken, String username) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode({
          "idToken": idToken,
          "displayName": username,
          "returnSecureToken": true
        }));

    final data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }

  updateEmail(String idToken, String email) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode(
            {"idToken": idToken, "email": email, "returnSecureToken": true}));
    final data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }

  updatePassword(String idToken, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:update?key=${apiKey}");
    var response = await http.post(url,
        body: jsonEncode({
          "idToken": idToken,
          "password": password,
          "returnSecureToken": true
        }));

    final data = jsonDecode(response.body);
    print("data : ${data}");
    return data;
  }
}
