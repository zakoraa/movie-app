import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/Ellipse 2.png",
                    scale: 2,
                  )),
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/Ellipse 1.png",
                    scale: 2,
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  height: Get.size.height * 0.6,
                  width: Get.size.width,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(105, 71, 51, 21),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          width: Get.size.width,
                          child: Column(
                            children: [
                              const Text(
                                "WELCOME",
                                style: TextStyle(fontSize: 30),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: TextField(
                                    cursorColor: Colors.grey,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(
                                          106, 158, 158, 158),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}
