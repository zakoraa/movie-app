import 'package:get/get.dart';
import 'dart:math';

import '../../../../movie/models/movie_model.dart';

class HomeController extends GetxController {
  final Random random = Random();
  void refreshList(RxList list) {
    list.shuffle(random);
  }
}
