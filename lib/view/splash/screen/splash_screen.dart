import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/res/routes/routes_name.dart';
import 'package:social_x/view/splash/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final splashController = Get.put(SplashController());
    splashController.splashService();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.blackColor,
        ),
      ),
    );
  }
}
