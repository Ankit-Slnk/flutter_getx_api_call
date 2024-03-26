import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/modules/splash/splash_controller.dart';

import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: body(),
        );
      },
    );
  }

  Widget body() {
    return const Center(
      child: FlutterLogo(
        size: 100,
      ),
    );
  }
}
