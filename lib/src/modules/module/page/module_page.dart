import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/main_app_bar.dart';
import 'package:osstp_flutter_hive/src/modules/module/view/module_list_item.dart';
import 'dart:convert' as convert;
import '../../../../generated/l10n.dart';
import '../../../routers/routers_navigator.dart';
import '../controller/module_controller.dart';

class ModulePage extends StatelessWidget {
  ModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModuleController>(
      init: ModuleController(),
      initState: (getState) {},
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(
            title: S.current.tabbar_module,
            rightActionList: [" + "],
            onTapFunction: (OnTapModel tapModel) {},
          ),
          body: SafeArea(
            top: false,
            child: ListView.builder(
              itemCount: 3, //controller.itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return ModuleListItem(
                    selected: true,
                    title: '${index}', voidCallback: () {
                  // Application.router
                  //     ?.navigateTo(context, controller.itemList[callbackIndex].routesName!)
                  //     .then((result) {});
                },);
              },
            ),
          ),
        );
      },
    );
  }
}
