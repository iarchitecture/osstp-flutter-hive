import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/utils/push_arguments.dart';
import 'package:osstp_flutter_hive/common/widget/main_app_bar.dart';
import 'package:osstp_flutter_hive/src/modules/module/view/module_list_item.dart';
import 'package:osstp_main_tabbar/osstp_main_tabbar.dart';
import '../../../../generated/l10n.dart';
import '../../../routers/routers_navigator.dart';
import '../controller/module_controller.dart';

class ModulePage extends StatelessWidget {
  const ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleController>(
      init: ModuleController(),
      initState: (getState) {},
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
            title: '${S.current.tabbar_module}(${controller.itemList.length})',
            rightActionList: [" + "],
            onTapFunction: (OnTapModel tapModel) {
              osstpBadge.badgeChange(index: 0, badge: '5');
              osstpBadge.badgeChange(index: 1, badge: '105'); //onlyPoint=true
              osstpBadge.badgeChange(index: 2, badge: '105');
            },
          ),
          body: SafeArea(
            child: ListView.builder(
              itemCount: controller.itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ModuleListItem(
                  selected: true,
                  title: controller.itemList[index].title,
                  voidCallback: () {
                    Application.push(
                      context,
                      controller.itemList[index].routesName!,
                      routeSettings: RouteSettings(
                        arguments: PushArguments(action: true), // 参数识别关闭方式
                      ),
                    )?.then((result) {});
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
