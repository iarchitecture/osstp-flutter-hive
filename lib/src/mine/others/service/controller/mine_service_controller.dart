import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/library/lib_refresh/smart_refresher.dart';
import '../../../mine/view/mine_body_view.dart';

class MineServiceController extends SuperController {
  final version = '1.0.0'.obs;

  final itemList = <SettingItemModel>[].obs;

  RefreshController refreshController = RefreshController(initialRefresh: false);

  void onRefresh() async {
    itemList.add(SettingItemModel(title: "功能介绍:", child: Text("jfiewjfoewiojf")));
    itemList.add(SettingItemModel(title: "功能介绍", child: Text("jfiewjfoewiojf")));
    itemList.add(SettingItemModel(title: "功能介绍", child: Text("jfiewjfoewiojf")));
    itemList.add(SettingItemModel(title: "功能介绍", child: Text("jfiewjfoewiojf")));
    itemList.add(SettingItemModel(title: "功能介绍", child: Text("jfiewjfoewiojf")));

    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1500));

    itemList.refresh();

    refreshController.refreshCompleted();
  }

  void onLoading() async {
    refreshController.loadNoData();
  }

  @override
  void onInit() {
    super.onInit();

    onRefresh();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
