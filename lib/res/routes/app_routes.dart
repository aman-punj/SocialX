import 'package:get/get.dart';
import 'package:social_x/res/routes/routes_name.dart';
import 'package:social_x/view/auth/screen/auth_screen.dart';
import 'package:social_x/view/home/screen/home_screen.dart';
import 'package:social_x/view/splash/screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: (() => const SplashScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.authView,
            page: (() => const AuthScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
        GetPage(
            name: RouteName.homeView,
            page: (() => const HomeScreen()),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 250)),
      ];
}
