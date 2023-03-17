import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_x/res/routes/routes_name.dart';

class SplashController extends GetxController {
  void splashService() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user == null) {
      Timer(const Duration(seconds: 3), (() {
        Get.offAllNamed(RouteName.authView);
      }));
    } else {
      Timer(const Duration(seconds: 3), (() {
        Get.offAllNamed(RouteName.homeView);
      }));
    }
  }
}
