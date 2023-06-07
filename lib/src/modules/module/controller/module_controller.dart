import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/utils/selected_item_model.dart';
import '../../../../generated/l10n.dart';
import '../../../routers/routers_config.dart';

class ModuleController extends SuperController {
  List<SelectedItemModel> itemList = [
    SelectedItemModel(title: '启动画面', image: Icons.collections, routesName: Routers.splashPage),
    SelectedItemModel(title: "引导画面", image: Icons.settings,routesName: Routers.guidePage),
    SelectedItemModel(title: "广告", image: Icons.settings,routesName: Routers.advertisementPage),
  ].obs;

  @override
  void onInit() {
    super.onInit();
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
