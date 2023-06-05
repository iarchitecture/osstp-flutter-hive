import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/getx_dialog_widget.dart';
import '../../../../common/theme/theme.dart';
import '../../../../common/widget/main_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../routers/routers_config.dart';
import '../../../routers/routers_navigator.dart';
import '../controller/mine_controller.dart';
import '../view/mine_header_view.dart';
import '../view/mine_body_view.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
              title: S.current.tabbar_mine,
              rightActionList:  [controller.logout.value] ,
              onTapFunction: (OnTapModel tapModel) {
                // OsstpDialog.getxDialog(
                //   dialogWidget: Padding(
                //     padding: const EdgeInsets.only(left: 68.0),
                //     child: EndDrawer(
                //       closeEndDrawer: (selected) {
                //         if (selected == true) {
                //           controller.refreshState(UserModel());
                //         }
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //   ),
                // );
              },
              actions: []),
          body: Container(
            color: ThemeColors.primaryBackgroundThemeColor(context),
            child: SafeArea(
              top: false,
              child: ListView.builder(
                itemCount: controller.itemList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? MineHeaderView(
                    authed: false,
                    avatarCallback: () {
                      // 头像
                    },
                    notAuthedCallback: () {
                      // Application.navigateWithParamsTo(context, Routes.loginPage)?.then((result) {
                      //   if (result is UserModel) {
                      //     if (!itIsEmpty(result.userName) && !itIsEmpty(result.userId)) {
                      //       controller.refreshState(result);
                      //     }
                      //   }
                      // });
                    },
                    itemCallback: () {
                      Application.push(context, Routers.mineServicePage)?.then((result) {});
                    },
                  )
                      : MineBodyWidget(
                    context: context,
                    index: index - 1,
                    authed: true,
                    itemList: controller.itemList,
                    notAuthedCallback: (callbackIndex) {
                      if (controller.itemList[callbackIndex].routesName != null) {
                        Application.router
                            ?.navigateTo(context, controller.itemList[callbackIndex].routesName!)
                            .then((result) {});
                      } else {
                        GetXDialog.show(
                          title: "需要认证",
                          content: "authed = true 时，完成跳转画面",
                        );
                      }
                    },
                    onTapCallback: (callbackIndex) {
                      if (controller.itemList[callbackIndex].routesName == null) {
                        GetXDialogDebug(
                            controller.itemList[callbackIndex].title);
                      } else {
                        Application.router
                            ?.navigateTo(context, controller.itemList[callbackIndex].routesName!)
                            .then((result) {});
                      }
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
