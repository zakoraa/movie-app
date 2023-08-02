import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/list_tile_widget.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.movies, required this.title});

  final title;
  final movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ScaffoldBackgroundTemplate(
            child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ),
                    Text(title),
                    const SizedBox(
                      width: 40.0,
                    ),
                  ],
                ),
              ),
              ListTileWidget(listMovie: movies),
            ],
          ),
        )),
      ),
    );
  }
}
