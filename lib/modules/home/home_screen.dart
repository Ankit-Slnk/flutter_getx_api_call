import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/modules/home/home_controller.dart';
import 'package:flutter_getx_api_call/modules/home/user_item_view.dart';
import 'package:flutter_getx_api_call/utils/app_strings.dart';
import 'package:flutter_getx_api_call/widgets/pagination_view.dart';
import 'package:flutter_getx_api_call/widgets/progress_bar.dart';

import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(usersStr),
          ),
          body: SafeArea(
            child: controller.isLoading.value ? const ProgressBar() : body(),
          ),
        );
      },
    );
  }

  Widget body() {
    return PaginationView(
      controller: controller,
      refreshIndicatorKey: controller.refreshIndicatorKey,
      itemView: (index) {
        return UserItemView(user: controller.list[index]);
      },
      listData: controller.list,
      onVisibilityChanged: () {
        controller.index();
      },
      onRefresh: () {
        controller.onRefresh();
      },
    );
  }
}
