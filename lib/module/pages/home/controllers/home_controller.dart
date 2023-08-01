import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../../../../routes/route_name.dart';
import '../../login/controllers/login_controller.dart';

class HomeController extends GetxController {
  LoginController loginController = Get.put(LoginController());

  final Random random = Random();

  RxInt selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void randomList(RxList list) {
    list.shuffle(random);
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
                  Get.offAllNamed(RouteName.loginView);
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
