import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/utils/app_strings.dart';
import 'package:flutter_getx_api_call/utils/utility.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class BaseController extends GetxController {
  RxBool stop = false.obs;
  RxBool isLoading = false.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  RxInt page = 1.obs;

  noDataLogic() {
    page.value = 1;
    stop.value = true;
  }

  onRefresh() {
    page.value = 1;
    stop.value = false;
  }

  Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  postCall({
    required String url,
    required Map request,
    bool isShowLoader = true,
  }) async {
    if (await checkInternet()) {
      if (isShowLoader) {
        isLoading.value = true;
        update();
      }
      print("url");
      print(url);
      print("request");
      print(request);
      http.Response response = await http.post(Uri.parse(url), body: request);
      print("response");
      print(response.body);
      if (isShowLoader) {
        isLoading.value = false;
        update();
      }
      return await jsonDecode(response.body);
    } else {
      showToast(noInternet);
    }
  }

  deleteCall({
    required String url,
    bool isShowLoader = true,
  }) async {
    if (await checkInternet()) {
      if (isShowLoader) {
        isLoading.value = true;
        update();
      }
      print("url");
      print(url);
      http.Response response = await http.delete(Uri.parse(url));
      print("response");
      print(response.body);
      if (isShowLoader) {
        isLoading.value = false;
        update();
      }
      return await jsonDecode(response.body);
    } else {
      showToast(noInternet);
    }
  }

  getCall({
    required String url,
    required Map<String, dynamic> request,
    bool isShowLoader = true,
  }) async {
    if (await checkInternet()) {
      if (isShowLoader) {
        isLoading.value = true;
        update();
      }
      var uri = Uri.parse(url);
      print("request");
      print(request);
      uri = uri.replace(queryParameters: request);
      print("uri");
      print(uri);
      http.Response response = await http.get(uri);
      print("response");
      print(response.body);
      if (isShowLoader) {
        isLoading.value = false;
        update();
      }
      return await jsonDecode(response.body);
    } else {
      showToast(noInternet);
    }
  }
}
