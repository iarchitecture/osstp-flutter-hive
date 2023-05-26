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
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
