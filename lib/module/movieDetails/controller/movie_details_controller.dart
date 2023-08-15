import 'package:get/get.dart';

class MovieDetailsController extends GetxController {
  RxBool isLiked = false.obs;

  void handleLike() {
    isLiked.value = !isLiked.value;
  }
}
