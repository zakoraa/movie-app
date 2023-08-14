import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/module/auth/auth_controller.dart';
import 'package:movieapp/module/home/controllers/movie_controller.dart';
import 'package:movieapp/module/home/controllers/serial_movie_controller.dart';
import 'package:movieapp/module/login/view/login_view.dart';
import 'package:movieapp/shared/utils/alert_dialog.dart';
import '../../login/controllers/login_controller.dart';

class HomeController extends GetxController {
  LoginController loginController = Get.put(LoginController());
  AuthController authController = Get.put(AuthController());
  MovieController movieController = Get.put(MovieController());
  MovieSerialController movieSerialController =
      Get.put(MovieSerialController());

  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  List moviesIn2023 = <Movie>[].obs;
  List moviesBefore2023 = <Movie>[].obs;
  List allMovies = [];

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
    AlertDialogUtils.showDialogUtils(context,
        title: const Text(
          "Do you want to Logout?",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              loginController.email!.text = "";
              loginController.password!.text = "";
              loginController.passwordIsVisible.value = true;
              Get.offAll(() => const LoginView());
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 30,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          )
        ]);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await movieSerialController.getData();
    await movieController.getData();
    allMovies.addAll(movieController.listViewMovieList);
    allMovies.addAll(movieSerialController.listViewMovieSerialList);
  }

  Future<void> onRefresh() async {
    movieController.isLoading.value = true;
    movieSerialController.isLoading.value = true;
    await movieSerialController.getData();
    await movieController.getData();
    print("NAME : ${authController.username}");
  }
}
