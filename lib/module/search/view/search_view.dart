import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/search/controller/seacrh_controller.dart';
import 'package:movieapp/shared/widgets/app_bar_custom.dart';
import 'package:movieapp/shared/widgets/list_tile_widget.dart';

import '../../../shared/utils/scaffold_background_template.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController());
    return Scaffold(
        body: SizedBox(
      height: Get.height,
      child: ScaffoldBackgroundTemplate(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: Get.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: Column(
                  children: [
                    AppBarCustom(onTap: () => Get.back(), title: "Search"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(46, 144, 143, 143),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        border: Border.all(
                          width: 0.5,
                          color: const Color.fromARGB(121, 189, 189, 189),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: controller.textEditingController,
                              onChanged: controller.onSearch,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              initialValue: null,
                              decoration: const InputDecoration.collapsed(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GetBuilder(
                      init: controller,
                      builder: (_) => controller.seacrhResult.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "No Result",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "normal",
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : ListTileWidget(listMovie: controller.seacrhResult),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
// TUNGGU YA SAYA BELAJAR UNTUK SEARCH DULU !