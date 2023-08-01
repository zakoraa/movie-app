import 'package:get/get.dart';
import 'package:movieapp/services/serial_service.dart';
import 'package:movieapp/models/serial_model.dart';

class MovieSerialController extends GetxController {
  RxList<MovieSerial> listMovieSerialList = <MovieSerial>[].obs;
  RxList<MovieSerial> carouselSliderMovieSerialList = <MovieSerial>[].obs;
  RxList<MovieSerial> trendingNowMovieSerialList = <MovieSerial>[].obs;
  final GetMovieSerial _getMovieSerial = GetMovieSerial();
  RxBool isLoading = true.obs;
  Future<void> getData() async {
    var data = await _getMovieSerial.getData();
    if (data.isNotEmpty) {
      listMovieSerialList.value = data;
      carouselSliderMovieSerialList.value = data;
      trendingNowMovieSerialList.value = data;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
