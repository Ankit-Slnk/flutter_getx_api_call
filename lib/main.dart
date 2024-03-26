import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/modules/splash/splash_binding.dart';
import 'package:flutter_getx_api_call/modules/splash/splash_screen.dart';
import 'package:flutter_getx_api_call/routes/app_pages.dart';
import 'package:flutter_getx_api_call/routes/app_routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: const SplashScreen(),
    ),
  );
}
