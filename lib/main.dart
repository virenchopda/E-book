import 'dart:async';
import 'package:e_book/app_services/auth_services.dart';
import 'package:e_book/controller/onboarding_controller.dart';
import 'package:e_book/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

///
import 'noInternet_screen.dart';
import 'utils/color_utils.dart';
import 'routes/route_helper.dart';
import 'utils/language_utils.dart';
import 'routes/route_constant.dart';
import 'view/splash/splash_screen.dart';
import 'controller/splash_controller.dart';
import 'viewModel/connectivity_view_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  try {
    await Firebase.initializeApp();
  } catch (e) {}

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

StreamController<bool> isLightTheme = StreamController();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityViewModel connectivityViewModel =
      Get.put(ConnectivityViewModel());

  @override
  initState() {
    super.initState();
    connectivityViewModel.startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return StreamBuilder<Object>(
          initialData: true,
          stream: isLightTheme.stream,
          builder: (context, AsyncSnapshot snapshot) {
            return GetMaterialApp(
              theme: AppTheme.lightTheme,
              title: "E-book",
              navigatorKey: Get.key,
              translations: Languages(),
              getPages: RouteHelper.routes,
              debugShowCheckedModeBanner: false,
              initialRoute: RouteConstant.inital,
              smartManagement: SmartManagement.full,
              locale: const Locale('en', 'US'),
              fallbackLocale: const Locale('en', 'US'),
              home: GetBuilder<ConnectivityViewModel>(
                init: ConnectivityViewModel(),
                builder: (connectivityViewModel) {
                  if (connectivityViewModel.isOnline != null) {
                    if (connectivityViewModel.isOnline!) {
                      return Splash();
                    } else {
                      return const NoInternetConnected();
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        );
      },
    );
  }

  AuthSetvices auth = Get.put(AuthSetvices());
  SplashController splashController = Get.put(SplashController());
  OnboardingController onboardingController = Get.put(OnboardingController());
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "NunitoSans",
    cardColor: ColorUtils.white,
    // scaffoldBackgroundColor: ColorUtils.white,
    // hintColor: ColorUtils.black,
    // canvasColor: ColorUtils.black,
    // textTheme: const TextTheme(),
    // primaryTextTheme: const TextTheme(
    //   labelMedium: TextStyle(color: ColorUtils.black),
    // )

    ///

    // primaryTextTheme: const TextTheme(
    //   labelMedium: TextStyle(color: ColorUtils.black),
    // ),
    // appBarTheme: const AppBarTheme(
    //   iconTheme: IconThemeData(color: ColorUtils.black),
    // ),
    // colorScheme: const ColorScheme.light(
    //   primary: ColorUtils.white,
    //   onPrimary: ColorUtils.white,
    //   secondary: ColorUtils.white,
    // ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "NunitoSans",
    cardColor: ColorUtils.black,
    // scaffoldBackgroundColor: ColorUtils.black,
    // hintColor: ColorUtils.white,
    // canvasColor: ColorUtils.white,
    // textTheme: const TextTheme(),

    ///

    // primaryTextTheme: const TextTheme(
    //   labelMedium: TextStyle(color: ColorUtils.black),
    // ),
    // appBarTheme: const AppBarTheme(
    //   iconTheme: IconThemeData(color: ColorUtils.black),
    // ),
    // colorScheme: const ColorScheme.light(
    //   primary: ColorUtils.white,
    //   onPrimary: ColorUtils.white,
    //   secondary: ColorUtils.white,
    // ),
  );
}
