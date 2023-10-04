import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/shared/widgets/circle_skelton.dart';
import 'package:movieapp/shared/widgets/skelton.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.height,
        width: Get.width,
        child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 128, 128, 128),
            highlightColor: Colors.grey.shade800,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 30,
                          ),
                          Icon(
                            Icons.search,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SkeltonWidget(height: 15, width: 150),
                            SizedBox(
                              height: 10.0,
                            ),
                            SkeltonWidget(height: 10, width: 130),
                          ],
                        ),
                        CircleSkeltonWidget(
                          size: 70,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 150,
                          width: Get.width * 0.05,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                        ),
                        SkeltonWidget(height: 225, width: Get.width * 0.75),
                        Container(
                          height: 150,
                          width: Get.width * 0.05,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeltonWidget(height: 15, width: 80),
                        SkeltonWidget(height: 15, width: 80)
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Row(
                      children: [
                        SkeltonWidget(height: 200, width: 140),
                        SizedBox(
                          width: 30.0,
                        ),
                        SkeltonWidget(height: 200, width: 140),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
