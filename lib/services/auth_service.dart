// ignore_for_file: avoid_init_to_null, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBaIL03Dw0RwkmNONPTJrd2qV-iHKs4J54");
    var response = await http.post(url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": false,
        }));

    var data = json.decode(response.body);
    return data;
  }

  signup(String username, String email, String password) async {
    try {
      Uri url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBaIL03Dw0RwkmNONPTJrd2qV-iHKs4J54");
      var response = await http.post(url,
          body: jsonEncode({
            "username": username,
            "email": email,
            "password": password,
            "displayName": username,
            "returnSecureToken": false
          }));

      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  updateProfile(String email, String password, String idToken,
      String? displayName, String? profilePicture) async {
    try {
      Uri url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyBaIL03Dw0RwkmNONPTJrd2qV-iHKs4J54");
      var response = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
            "idToken": idToken,
            "displayName": displayName ?? email,
            "profilePicture": profilePicture ??
                'https://icon-library.com/images/default-profile-icon/default-profile-icon-6.jpg',
            "returnSecureToken": false
          }));

      final data = jsonDecode(response.body);
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
