import 'package:flutter/material.dart';
import 'package:osstp_flutter_hive/common/widget/inkWell_button.dart';
import '../../../../../common/theme/theme.dart';
import '../../../../../common/widget/elevated_button_widget.dart';
import '../../../../../common/widget/getx_dialog_widget.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../routers/routers_config.dart';
import '../../../../routers/routers_navigator.dart';
import '../../../mine/view/mine_body_view.dart';
import '../view/setting_home_item.dart';
import '../../../../../generated/l10n.dart';

/// Setting
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<SettingItemModel> itemList = [
    SettingItemModel(
        title: S.current.setting_language, image: Icons.language, routesName: Routers.settingChangeLanguagePage),
    SettingItemModel(
        title: S.current.setting_theme, image: Icons.color_lens_outlined, routesName: Routers.settingChangeThemePage),
    SettingItemModel(
        title: S.current.setting_auth, image: Icons.screen_lock_portrait, routesName: Routers.settingAuthPage),
    SettingItemModel(
        title: S.current.setting_about, image: Icons.description_rounded, routesName: Routers.settingAboutPage),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: S.of(context).setting_setting),
      body: Container(
        color: ThemeColors.primaryBackgroundThemeColor(context),
        child: SafeArea(
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
                                      // bool result = await ApplicationConfig.instance.resetPreferencesData();
                                      // if (!itIsEmpty(result) && result == true) {
                                        Application.popToSplashPage(context);
                                      // }
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
      ),
    );
  }

  navigationTo(String router) {
    Application.push(context, router)?.then((result) {});
  }
}
