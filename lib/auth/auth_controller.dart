import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  String? acceptedEmail = null;
  Future<void> login(String email, String password) async {
    try {
      Uri url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBaIL03Dw0RwkmNONPTJrd2qV-iHKs4J54");
      var response = await http.post(url,
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));

      var data = json.decode(response.body);
      print("data : ${data}");
      if (data.keys == '(error)') {
        acceptedEmail = null;
      } else {
        acceptedEmail = data['email'];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
