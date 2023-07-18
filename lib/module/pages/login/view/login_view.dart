import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/login/controllers/login_controller.dart';
import 'package:movieapp/routes/route_name.dart';

import '../../../widgets/textfield_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: Get.size.width,
                            child: Column(
                              children: [
                                const Text(
                                  "WELCOME",
                                  style: TextStyle(fontSize: 30),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                const TextFieldWidget(
                                    text: "Username", icon: Icons.person),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                const TextFieldWidget(
                                  text: "Password",
                                  icon: Icons.key,
                                  suffixIcon: true,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () => Get.toNamed(RouteName.mainPage),
                                    child: Container(
                                      width: Get.size.width,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              94, 255, 193, 7),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                          child: Text(
                                        "Login",
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
