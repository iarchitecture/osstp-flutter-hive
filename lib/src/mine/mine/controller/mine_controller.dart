import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/utils/selected_item_model.dart';
import '../../../../generated/l10n.dart';
import '../../../routers/routers_config.dart';

class MineController extends SuperController {
  final logout = ''.obs;

  final itemList = [
    SelectedItemModel(
        title: S.current.setting_about, image: Icons.hive_rounded, routesName: Routers.settingAboutPage),
    // SelectedItemModel(title: S.current.mine_favorite, image: Icons.collections, routesName: Routers.favoritePage),
    SelectedItemModel(title: S.current.mine_template, image: Icons.abc_rounded),
    SelectedItemModel(title: S.current.setting_setting, image: Icons.settings, routesName: Routers.settingHomePage),
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
