import 'package:get/get.dart';
import '../routes/route_helper.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(RouteHelper.getOnBoarding1Route()),
    );

    super.onInit();
  }
}
