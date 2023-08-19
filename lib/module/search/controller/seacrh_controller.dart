import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';

class SearchViewController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textEditingController = TextEditingController();
  List searchResult = [];

  onSearch(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      update();
      return;
    } else {
      for (var e in homeController.allMovies) {
        if (e.title.toLowerCase().contains(text.toLowerCase())) {
          searchResult.add(e);
          update();
        }
      }
    }
  }

  void clearSearch() {
    textEditingController!.clear();
    searchResult.clear();
    Get.forceAppUpdate();
  }
}
