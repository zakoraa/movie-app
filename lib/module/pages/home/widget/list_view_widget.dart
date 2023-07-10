import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/home/controllers/home_controller.dart';
import '../../../../movie/controllers/movie_get_discover.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    HomeController homeController = Get.put(HomeController());
    final movie = movieController.listMovie;
    homeController.refreshList(movie);
    return Obx(() {
      return (movieController.isLoading.value)
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 40, bottom: 30),
                  child: Text("For You"),
                ),
                SizedBox(
                  height: 300,
                  width: Get.size.width,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(25)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    "${MovieController.imageUrlW500}${movie[index].poster}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  "${movie[index].title}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 232, 232, 232)),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                movie[index].releaseDate!.substring(0, 4),
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            );
    });
  }
}
