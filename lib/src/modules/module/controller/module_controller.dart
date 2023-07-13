import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/utils/selected_item_model.dart';
import '../../../routers/routers_config.dart';

class ModuleController extends SuperController {
  List<SelectedItemModel> itemList = [
    SelectedItemModel(title: '启动画面', image: Icons.collections, routesName: Routers.splashPage),
    SelectedItemModel(title: "引导画面", image: Icons.settings,routesName: Routers.guidePage),
    SelectedItemModel(title: "广告", image: Icons.info_outline,routesName: Routers.advertisementPage),
  ].obs;

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
