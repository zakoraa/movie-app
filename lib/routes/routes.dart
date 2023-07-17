import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/view/home_view.dart';
import 'package:movieapp/module/pages/movieDetails/view/movie_details_view.dart';
import 'package:movieapp/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.homeView, page: () => const HomeView()),
    GetPage(
        name: RouteName.movieDetailsView,
        page: () => MovieDetailsView(),
        transition: Transition.fade)
  ];
}
