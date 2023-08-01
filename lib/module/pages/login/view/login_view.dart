// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/pages/login/controllers/login_controller.dart';
import 'package:movieapp/routes/route_name.dart';
import '../../../widgets/form_login_signup.dart';
import '../../../widgets/textfield_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    TextEditingController? email;
    TextEditingController? password;
    return FormLoginSignup(
        content: Positioned(
      bottom: 0,
      child: Container(
        height: Get.size.height * 0.6,
        width: Get.size.width,
        decoration: const BoxDecoration(
            color: Color.fromARGB(126, 71, 51, 21),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
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
                  TextFieldWidget(
                      selectedController: loginController,
                      controller: loginController.email,
                      text: "Email",
                      icon: Icons.email),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFieldWidget(
                    selectedController: loginController,
                    controller: loginController.password,
                    text: "Password",
                    icon: Icons.key,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Obx(() => Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),               
                          onTap: () => loginController.loginWithFirebase(
                              context, RouteName.mainPage),
                          child: Container(
                            width: Get.size.width * 0.75,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(176, 255, 193, 7),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              loginController.isLoading.value
                                  ? "Loading..."
                                  : "Login",
                              style: const TextStyle(fontSize: 14),
                            )),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteName.signupView),
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: "normal",
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
