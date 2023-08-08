import 'dart:math';

import 'package:get/get.dart';
import 'package:movieapp/services/serial_service.dart';
import 'package:movieapp/models/serial_model.dart';

class MovieSerialController extends GetxController {
  RxList<MovieSerial> listViewMovieSerialList = <MovieSerial>[].obs;
  RxList<MovieSerial> carouselSliderMovieSerialList = <MovieSerial>[].obs;
  RxList<MovieSerial> trendingNowMovieSerialList = <MovieSerial>[].obs;
  final GetMovieSerial _getMovieSerial = GetMovieSerial();
  RxBool isLoading = true.obs;
  Random random = Random();
  Future<void> getData() async {
    var data = await _getMovieSerial.getData();
    if (data.isNotEmpty) {
      listViewMovieSerialList.value = List.from(data);
      listViewMovieSerialList.shuffle(random);
      carouselSliderMovieSerialList.value = List.from(data);
      carouselSliderMovieSerialList.shuffle(random);
      trendingNowMovieSerialList.value = List.from(data);
    }
    isLoading.value = false;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   getData();
  // }
}
