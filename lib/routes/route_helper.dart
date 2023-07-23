import 'package:e_book/view/home/home.dart';
import 'package:e_book/view/onboarding/onboarding_2.dart';

import 'route_constant.dart';
import 'package:get/get.dart';

import '../view/onboarding/onboarding_1.dart';
import '../view/splash/splash_screen.dart';

class RouteHelper {
  /// ROUTE
  static String getSplashRoute() => RouteConstant.splash;
  static String getOnBoarding1Route() => RouteConstant.onboarding;

  static String getOnBoarding2Route() => RouteConstant.onboarding2;
  static String getHomeRoute() => RouteConstant.home;

  /// LIST GETPAGE
  static List<GetPage> routes = [
    GetPage(name: RouteConstant.splash, page: () => Splash()),
    GetPage(name: RouteConstant.onboarding, page: () => const Onboarding1()),
    GetPage(name: RouteConstant.onboarding2, page: () => Onboarding2()),
    GetPage(name: RouteConstant.home, page: () => Home()),
  ];
}
