import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  TextEditingController? username;
  RxBool obscureText = false.obs;
  RxBool isLoading = false.obs;
}
