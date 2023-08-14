import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';

class SearchController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  TextEditingController? textEditingController = TextEditingController();
  List seacrhResult = [];

  onSearch(String text) async {
    seacrhResult.clear();
    if (text.isEmpty) {
      update();
      return;
    } else {
      for (var e in homeController.allMovies) {
        if (e.title.toLowerCase().contains(text.toLowerCase())) {
          seacrhResult.add(e);
          update();
        }
      }
    }
  }
}
