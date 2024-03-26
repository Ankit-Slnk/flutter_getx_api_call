import 'dart:async';

import 'package:flutter_getx_api_call/base_controller/base_controller.dart';
import 'package:flutter_getx_api_call/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), gotoHome);
    super.onInit();
  }

  gotoHome() {
    Get.offNamedUntil(
      AppRoutes.home,
      (route) => false,
    );
  }
}
