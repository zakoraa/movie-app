import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/module/login/view/login_view.dart';
import 'dart:math';
import '../../login/controllers/login_controller.dart';

class HomeController extends GetxController {
  LoginController loginController = Get.put(LoginController());

  RxInt selectedIndex = 0.obs;

  List moviesIn2023 = <Movie>[].obs;
  List moviesBefore2023 = <Movie>[].obs;

  void sortedByYear(List list) {
    moviesIn2023 =
        list.where((movie) => int.parse(movie.releaseDate) == 2023).toList();
    moviesIn2023.sort((a, b) => a.title.compareTo(b.title));
    moviesBefore2023 =
        list.where((movie) => int.parse(movie.releaseDate) < 2023).toList();
    moviesBefore2023.sort((a, b) => a.title.compareTo(b.title));
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void sortedByRating(RxList list) {
    list.sort((a, b) => a.title.compareTo(b.title));
    list.sort((a, b) => b.rating.compareTo(a.rating));
    list.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
  }

  void confirmLogout(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Do you want to Logout?",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  loginController.email!.text = "";
                  loginController.password!.text = "";
                  loginController.passwordIsVisible.value = false;
                  Get.offAll(()=> LoginView());
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
