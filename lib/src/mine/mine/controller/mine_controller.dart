import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';
import '../../../routers/routers_config.dart';
import '../view/mine_body_view.dart';

class MineController extends SuperController {
  final logout = ''.obs;

  final itemList = [
    SettingItemModel(
        title: S.current.mine_title, image: Icons.home_repair_service_outlined, routesName: Routers.settingAboutPage),
    // SettingItemModel(title: S.current.mine_favorite, image: Icons.collections, routesName: Routers.favoritePage),
    SettingItemModel(title: S.current.mine_template, image: Icons.abc_rounded),
    SettingItemModel(title: S.current.setting_setting, image: Icons.settings, routesName: Routers.settingHomePage),
  ].obs;

  @override
  void onInit() {
    super.onInit();
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
