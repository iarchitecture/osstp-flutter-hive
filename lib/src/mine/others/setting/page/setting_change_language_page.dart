import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../../../../../common/config/application_config.dart';
import '../../../../../common/utils/localizations_utils.dart';
import '../../../../../common/widget/getx_dialog_widget.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../routers/routers_navigator.dart';
import '../view/setting_action_item.dart';

import '../../../../../generated/l10n.dart';

/// change language
class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  bool select = false;
  String language = '';
  @override
  void initState() {
    super.initState();

    localeLanguage();
  }

  localeLanguage() async {
    language = await LocalizationsUtils.current.getLocaleDisplayLanguage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: S.of(context).setting_language),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Text("${S.of(context).setting_current_language}：$language"),
          ),
          SettingActionItem(
            title: "中文：",
            selected: true,
            selectedImage: Icons.arrow_forward,
            voidCallback: () async {
              GetXDialog.show(
                content: S.of(context).setting_change_theme_alert,
                contentTextAlign: TextAlign.center,
                showCancelButton: true,
                onConfirm: () async {
                  bool result = await LocalizationsUtils.current.setLanguage(ApplicationConfig.defaultLanguage);
                  if (result == true) {
                    finishPush();
                  }
                },
              );
            },
          ),
          SettingActionItem(
            title: "English：",
            selected: true,
            selectedImage: Icons.arrow_forward,
            voidCallback: () async {
              GetXDialog.show(
                content: S.of(context).setting_change_theme_alert,
                contentTextAlign: TextAlign.center,
                showCancelButton: true,
                onConfirm: () async {
                  bool result = await LocalizationsUtils.current.setLanguage(ApplicationConfig.supportLanguageEN);
                  if (result == true) {
                    finishPush();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  finishPush() {
    /// 重新加载刷新语言类型
    Application.popToSplashPage(context);
  }
}
