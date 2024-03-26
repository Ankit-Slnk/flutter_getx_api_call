import 'package:flutter_getx_api_call/modules/home/home_binding.dart';
import 'package:flutter_getx_api_call/modules/home/home_screen.dart';
import 'package:flutter_getx_api_call/modules/splash/splash_binding.dart';
import 'package:flutter_getx_api_call/modules/splash/splash_screen.dart';
import 'package:flutter_getx_api_call/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
