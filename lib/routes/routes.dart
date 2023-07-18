import 'package:get/get.dart';
import 'package:movieapp/main_page.dart';
import 'package:movieapp/module/pages/home/view/movie_home_view.dart';
import 'package:movieapp/module/pages/home/view/serial_movie_home_view.dart';
import 'package:movieapp/module/pages/login/view/login_view.dart';
import 'package:movieapp/module/pages/movieDetails/view/movie_details_view.dart';
import 'package:movieapp/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.loginView, page: () => const LoginView()),
    GetPage(name: RouteName.mainPage, page: () => const MainPage()),
    GetPage(name: RouteName.movieHomeView, page: () => const MovieHomeView()),
    GetPage(
        name: RouteName.serialMovieHomeView,
        page: () => const SerialMovieHomeView()),
    GetPage(
        name: RouteName.movieDetailsView,
        page: () => MovieDetailsView(),
        transition: Transition.fade,
        popGesture: true)
  ];
}
