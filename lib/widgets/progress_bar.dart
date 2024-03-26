import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/utils/app_colors.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: Get.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: black.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(black),
          ),
        ),
      ),
    );
  }
}
