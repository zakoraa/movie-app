import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../movie/controllers/movie_get_discovere.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return Obx(() => SizedBox(
          height: 225,
          width: Get.size.width,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: movieController.listMovie.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 225,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${movieController.listMovie.value[index].poster}",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
