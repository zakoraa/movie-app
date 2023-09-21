// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/module/auth/auth_controller.dart';

class UserService {
  String? apiKey = dotenv.env['FIREBASE_API_KEY'];
  AuthController authController = Get.put(AuthController());
  String? id;

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
