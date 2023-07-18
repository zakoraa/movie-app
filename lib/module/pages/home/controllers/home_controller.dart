import 'package:get/get.dart';
import 'dart:math';

import '../../../../api/movie/controllers/movie_get_discover.dart';
import '../../../../api/movie/models/movie_model.dart';

class HomeController extends GetxController {
  final Random random = Random();

  RxInt selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void randomList(RxList list){
  list.shuffle(random);
  }

  void sortedByRating(RxList list) {
    list.sort((a, b) => b.rating.compareTo(a.rating));
  }
}
