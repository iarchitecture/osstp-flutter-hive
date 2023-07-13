import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/getx_dialog_widget.dart';
import 'package:osstp_flutter_hive/src/main_tabbar/model/advertisement_model.dart';
import 'package:osstp_flutter_hive/src/mine/mine/page/mine_page.dart';
import 'package:osstp_main_tabbar/osstp_main_tabbar.dart';
import '../../../../../generated/l10n.dart';
import '../../../common/utils/logger.dart';
import '../../home/home/page/home_page.dart';
import '../../modules/module/page/module_page.dart';
import '../../modules/others/inactive/page/inactive_page.dart';

class TabBarControllers {
  OsstpMainTabBarItem tabBarItem;
  Widget pageWidget;

  TabBarControllers({required this.tabBarItem, required this.pageWidget});
}

class MainTabBarController extends SuperController {
  final authed = false.obs;
  final badge = OsstpBadge(showBadge: true).obs;
  GlobalKey<NavigatorState>? tempNavigatorKey = GlobalKey();

  List<TabBarControllers> tabItemList = [
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.tabbar_home, icon: const Icon(Icons.home_rounded)),
        pageWidget: const HomePage()),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(
            label: S.current.tabbar_module, icon: const Icon(Icons.view_module_rounded), onlyPoint: true),
        pageWidget: const ModulePage()),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.tabbar_mine, icon: const Icon(Icons.accessibility_rounded)),
        pageWidget: const MinePage()),
  ];

  @override
  onInit() {
    super.onInit();
    _badgeListening();
  }

  _badgeListening() {
    osstpBadge.showBadge = true;
    osstpBadge.addListener(() {
      badge.value = osstpBadge;
      badge.refresh();
    });
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {
    if (Get.isDialogOpen == true) {
      return;
    }
    osstpLogger.d('Inactive Page: show');
    // GetXDialog.general(
    //   navigatorKey: tempNavigatorKey,
    //   pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    //     return const InactivePage();
    //   },
    // );
  }

  @override
  void onPaused() {}

  @override
  void onResumed() {
    // if (Navigator.of(Get.context ?? tempNavigatorKey!.currentState!.overlay!.context).canPop()) {
    //   osstpLogger.d('Inactive Page: dismiss');
    //   Navigator.of(Get.context ?? tempNavigatorKey!.currentState!.overlay!.context).pop();
    // }
  }
}
