import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg) {
  Fluttertoast.showToast(msg: msg);
}

List<BoxShadow>? boxShadow = [
  BoxShadow(
    blurRadius: 3,
    spreadRadius: 1,
    offset: const Offset(1, 3),
    color: black.withOpacity(0.1),
  ),
];
