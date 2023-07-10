import 'package:get/get.dart';
import 'package:movieapp/api/movieSerial/api/get_movie_serial.dart';
import 'package:movieapp/api/movieSerial/models/serial_model.dart';

class MovieSerialController extends GetxController {
  RxList<MovieSerial> listMovieSerial = <MovieSerial>[].obs;
  final GetMovieSerial _getMovieSerial = GetMovieSerial();
  Future<void> getData() async {
    var data = await _getMovieSerial.getData();
    if (data != null) {
      listMovieSerial.value = data;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
