import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/src/mine/others/setting/controller/SettingHomeController.dart';
import '../../../../../common/config/application_config.dart';
import '../../../../../common/utils/selected_item_model.dart';
import '../../../../../common/utils/string_utils.dart';
import '../../../../../common/widget/elevated_button_widget.dart';
import '../../../../../common/widget/getx_dialog_widget.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../routers/routers_config.dart';
import '../../../../routers/routers_navigator.dart';
import '../view/setting_home_item.dart';
import '../../../../../generated/l10n.dart';

/// Setting
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SelectedItemModel> itemList = [
    SelectedItemModel(
        title: S.current.setting_language, image: Icons.language, routesName: Routers.settingChangeLanguagePage),
    SelectedItemModel(
        title: S.current.setting_theme, image: Icons.color_lens_outlined, routesName: Routers.settingChangeThemePage),
    SelectedItemModel(
        title: S.current.setting_auth, image: Icons.screen_lock_portrait, routesName: Routers.settingAuthPage),
    SelectedItemModel(
        title: S.current.setting_about, image: Icons.description_rounded, routesName: Routers.settingAboutPage),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingHomeController(),
      initState: (state) {

      },
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(title: S.current.setting_setting),
          body: SafeArea(
              top: false,
              child: ListView(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SettingHomeItem(
                          needSpaceList: const [0, 1],
                          context: context,
                          index: index,
                          onTapCallback: (callbackIndex) {
                            navigationTo(itemList[callbackIndex].routesName!);
                          },
                          itemList: itemList);
                    },
                    itemCount: itemList.length,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 88.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ElevatedButtonWidget.normal(
                                child: Text(S.of(context).setting_reset),
                                onPressed: () {
                                  GetXDialog.show(
                                      title: S.of(context).setting_reset_or_not,
                                      showCancelButton: true,
                                      onConfirm: () async {
                                        bool result = await ApplicationConfig.instance.resetPreferencesData();
                                        if (result == true) {
                                          Application.popToSplashPage(context);
                                        }
                                      });
                                },
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "⚠️ ${S.of(context).setting_reset_description}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      }
    );
  }

  navigationTo(String router) {
    Application.push(context, router)?.then((result) {});
  }
}
