import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/view/auth/controller/auth_controller.dart';
import 'package:social_x/view/auth/widgets/auth_app_bar.dart';
import 'package:social_x/view/auth/widgets/auth_body.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [const AuthAppBar(), AuthBody()],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: InkWell(
            onTap: (() {
              if (authController.authState.value == "login") {
                if (authController.signInFormKey.currentState!.validate()) {
                  authController.login(context);
                }
              } else {
                if (authController.signUpFormKey.currentState!.validate()) {
                  authController.signUp(context);
                }
              }
            }),
            child: Container(
                height: Get.height * 0.08,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Obx((() {
                  return Center(
                    child: authController.loading.value == true
                        ? const CircularProgressIndicator(
                            color: AppColor.blackColor,
                          )
                        : Text(
                            authController.authState.value == "login"
                                ? "LOGIN"
                                : "REGISTER",
                            style: TextStyle(
                                color: AppColor.secondaryTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                  );
                }))),
          ),
        ));
  }
}
