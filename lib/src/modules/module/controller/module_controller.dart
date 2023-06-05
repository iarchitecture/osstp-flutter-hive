import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';

class ModuleController extends SuperController {
  // List<SettingItemModel> itemList = [
  //   // SettingItemModel(title: S.current.mine_favorite, image: Icons.collections, routesName: Routes.favoritePage),
  //   // SettingItemModel(title: "朋友圈", image: Icons.people_outline_outlined),
  //   // SettingItemModel(title: "卡包", image: Icons.shopping_bag),
  //   // SettingItemModel(title: "表情", image: Icons.tag_faces_sharp),
  //   // SettingItemModel(title: "设置", image: Icons.settings, routesName: Routes.settingHomePage),
  // ].obs;

  @override
  void onInit() {
    super.onInit();
    network();
  }

  network() {
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
