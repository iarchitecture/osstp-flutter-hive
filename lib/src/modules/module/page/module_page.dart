import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/main_app_bar.dart';
import 'dart:convert' as convert;
import '../../../../generated/l10n.dart';
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
            title: S.of(context).tabbar_module,
            rightActionList: [" + "],
            onTapFunction: (OnTapModel tapModel) {},
          ),
          body: Container(
            child: SafeArea(
              top: false,
              child: ListView.builder(
                itemCount: 3,//controller.itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ModulesItem(title: '${index}');
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class ModulesItem extends StatelessWidget {
  ModulesItem(
      {Key? key,
      this.titleWidget,
      this.title,
      this.description,
      this.selected = false,
      this.selectedImage,
      this.selectedWidget,
      this.favoriteValueChanged,
      this.voidCallback})
      : super(key: key);

  Widget? titleWidget;
  String? title;
  String? description;
  IconData? selectedImage;
  Widget? selectedWidget;

  bool? switchValue;
  ValueChanged<int>? favoriteValueChanged;

  bool selected;
  VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (voidCallback != null) {
          voidCallback!();
        }
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleWidget ?? Text(title ?? ''),
                        Offstage(
                          offstage: description == null ? true : false,
                          child: Container(
                            child: Text(
                              description ?? "",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 20,
                  onPressed: () {
                    if (favoriteValueChanged != null) {
                      favoriteValueChanged!(0);
                    }
                  },
                  icon: (selected
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : const Icon(
                          Icons.favorite,
                        )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
