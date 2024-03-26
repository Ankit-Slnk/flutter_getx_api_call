import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/base_controller/base_controller.dart';
import 'package:flutter_getx_api_call/models/users_response.dart';
import 'package:flutter_getx_api_call/utils/app_strings.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxList<UserDetails> list = <UserDetails>[].obs;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    index();
    super.onInit();
  }

  index() async {
    var request = <String, dynamic>{};
    request["page"] = page.value.toString();

    UsersResponse response = UsersResponse.fromJson(
      await getCall(
        url: usersApi,
        request: request,
        isShowLoader: list.isEmpty,
      ),
    );

    if (response.data!.isNotEmpty) {
      page.value = page.value + 1;
      list.addAll(response.data!);
    } else {
      noDataLogic();
    }
    update();
  }

  @override
  onRefresh() {
    super.onRefresh();
    list.value = [];
    index();
  }
}
