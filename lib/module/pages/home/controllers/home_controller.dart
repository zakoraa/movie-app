import 'package:get/get.dart';
import 'dart:math';

class HomeController extends GetxController {
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
}
