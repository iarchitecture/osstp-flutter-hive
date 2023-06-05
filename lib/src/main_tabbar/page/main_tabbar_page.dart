import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:osstp_main_tabbar/osstp_main_tabbar.dart';
import '../controller/main_tabbar_controller.dart';
import '../view/main_tabbar_indexed_stack_view.dart';

class MainTabBarPage extends StatefulWidget {
  const MainTabBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainTabBarPageState();
}

class _MainTabBarPageState extends State<MainTabBarPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainTabBarController(),
      initState: (state) {},
      didChangeDependencies: (state) {},
      didUpdateWidget: (build, state) {},
      builder: (MainTabBarController controller) {
        return Scaffold(
          body: MainIndexedStackView(
            index: _tabController.index,
            itemCount: controller.tabItemList.length,
            currentItem: (context, index) {
              return controller.tabItemList[index].pageWidget;
            },
          ),
          bottomNavigationBar: Obx(
            () => OsstpMainTabBar(
              badge: controller.badge.value,
              items: controller.tabItemList.map((e) => e.tabBarItem).toList(),
              currentIndex: _tabController.index,
              onTap: (index) {
                // if (controller.tabItemList[index].pageWidget is MorePage) {
                //   OsstpDialog.getxDialog(title: "", content: "商家版才有「更多」功能", titleTextAlign: Alignment.center, onConfirm: () {
                //     setState(() {
                //       _tabController.animateTo(index);
                //     });
                //   });
                // } else {
                setState(() {
                  _tabController.animateTo(index);
                });
                // }
              },
              authed: controller.authed.value,
              needAuthTabItems: const [], //[controller.tabItemList.length - 1],
              notAuthedCallback: (index) {
                // OsstpDialog.getxDialog(
                //   title: "认证",
                //   content: "查看更多功能，请注册登录",
                //   contentTextAlign: TextAlign.center,
                //   onCancel: () {},
                //   showCancelButton: true,
                //   confirmTitle: "登录",
                //   onConfirm: () {
                //     // String jsonString = convert.jsonEncode(UserInfoModel());
                //     // Application.navigateWithParamsTo(context, Routes.loginPage)?.then(
                //     //   (result) {
                //     //     if (result is UserModel) {
                //     //       if (!itIsEmpty(result.userName) && !itIsEmpty(result.userId)) {
                //     //         ApplicationConfig.instance.loginAction(result);
                //     //         setState(() {
                //     //           _tabController.index = index;
                //     //         });
                //     //       }
                //     //     }
                //     //   },
                //     // );
                //   },
                // );
              },
              type: BottomNavigationBarType.fixed,
            ),
          ),
        );
      },
    );
  }
}
