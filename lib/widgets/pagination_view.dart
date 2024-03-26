import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/base_controller/base_controller.dart';
import 'package:flutter_getx_api_call/widgets/empty_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PaginationView extends StatelessWidget {
  final BaseController controller;
  final String? emptyViewTitle;
  final List listData;
  final Widget Function(int index) itemView;
  final Function onVisibilityChanged;
  final Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  const PaginationView({
    super.key,
    required this.controller,
    this.emptyViewTitle,
    required this.listData,
    required this.itemView,
    required this.onVisibilityChanged,
    required this.onRefresh,
    required this.refreshIndicatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: () async {
        onRefresh();
      },
      child: !controller.isLoading.value && listData.isEmpty
          ? EmptyView(title: emptyViewTitle)
          : ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: listData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ((listData.length - 1) == index)
                        ? VisibilityDetector(
                            key: Key(index.toString()),
                            child: itemView(index),
                            onVisibilityChanged: (visibilityInfo) {
                              if (!controller.stop.value) {
                                onVisibilityChanged();
                              }
                            },
                          )
                        : itemView(index)
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16,
                );
              },
            ),
    );
  }
}
