import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/main.dart';
import 'package:osstp_main_tabbar/osstp_main_tabbar.dart';

import '../../../../../generated/l10n.dart';
import '../../home/home/page/home_page.dart';

class TabBarControllers {
  OsstpMainTabBarItem tabBarItem;
  Widget pageWidget;

  TabBarControllers({required this.tabBarItem, required this.pageWidget});
}

class MainTabBarController extends SuperController {
  final authed = false.obs;
  final badge = OsstpBadge(showBadge: true).obs;

  List<TabBarControllers> tabItemList = [
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.tabbar_home, icon: const Icon(Icons.home_rounded)),
        pageWidget: const HomePage(title: "home",)),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(
            label: S.current.tabbar_module, icon: const Icon(Icons.view_module_rounded), onlyPoint: true),
        pageWidget: const HomePage()),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.product_stock, icon: const Icon(Icons.store_rounded)),
        pageWidget: const HomePage(title: '999')),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.tabbar_mine, icon: const Icon(Icons.accessibility_rounded)),
        pageWidget: const HomePage()),
    TabBarControllers(
        tabBarItem: OsstpMainTabBarItem(label: S.current.tabbar_more, icon: const Icon(Icons.password_rounded)),
        pageWidget: const HomePage())
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
  void onDetached() {
    // TODO: implement onDetached
    print("onDetached");
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
    print("onInactive");
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
    print("onPaused");
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    print("onResumed");
  }
}
