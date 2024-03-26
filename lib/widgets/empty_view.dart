import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  final String? title;
  const EmptyView({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        SizedBox(
          width: Get.width,
          height: Get.height - ((AppBar().preferredSize.height * 2) + 30),
          child: Center(
            child: Text(
              title ?? "No data",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
