import 'dart:convert' as convert;
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:osstp_flutter_hive/src/modules/others/advertisement/page/advertisement_page.dart';

import '../main_tabbar/page/main_tabbar_page.dart';
import '../mine/mine/page/mine_profile_page.dart';
import '../mine/others/setting/page/setting_about_page.dart';
import '../mine/others/setting/page/setting_auth_page.dart';
import '../mine/others/setting/page/setting_change_language_page.dart';
import '../mine/others/setting/page/setting_change_theme_page.dart';
import '../mine/others/setting/page/setting_home_page.dart';
import '../modules/others/guide/page/guide_page.dart';
import '../modules/others/splash/page/splash_page.dart';

var routeNotFoundHandle = Handler(
  type: HandlerType.function,
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    if (kDebugMode) {
      print("ROUTE WAS NOT FOUND !!!");
    }
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Hey Hey!",
            style: TextStyle(
              color: Color(0xFF00D6F7),
              fontFamily: "Lazer84",
              fontSize: 22.0,
            ),
          ),
          content: const Text("ROUTE WAS NOT FOUND !!!"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("OK"),
              ),
            ),
          ],
        );
      },
    );
    return;
  },
);

var splashPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SplashPage();
});

var guidePageRouteHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const GuidePage();
});
var advertisementPageRouteHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const AdvertisementPage();
});
var mainTabBarRouteHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MainTabBarPage();
});

// var editPreviewPageRouteHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return EditPreviewPage();
// });
// var templateEditPageRouteHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//   HomeEditItemListModel? listModel = JsonMapper.fromJson<HomeEditItemListModel>(convert.jsonDecode(params['model'].first));
//   print(listModel?.editItemList.length);
//   return EditTemplatePage(itemListModel: listModel);
// });
//
// var cyclePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const CyclePage();
// });

// var favoritePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return FavoritePage();
// });
//
var settingPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SettingPage();
});
//
// var mineServicePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const MineServicePage();
// });
var settingAboutPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SettingAboutPage();
});
//
var settingChangeLanguagePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ChangeLanguagePage();
});
var settingChangeThemePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
// return DemoSimpleComponent(message: message, color: color, result: result);
  return const ChangeThemePage();
});

var mineProfilePageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
// return DemoSimpleComponent(message: message, color: color, result: result);
  return const MineProfilePage();
});

//
// /// Handles deep links into the app
// /// To test on Android:
// ///
// /// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
// var loginPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
//   // UserInfoModel? userInfoModel = UserInfoModel.fromJson(convert.jsonDecode(params['userInfoModel'][0]));
//   return LoginPage(
//       // userInfoModel: userInfoModel,
//       );
// });
//
// var registerPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const RegisterPage();
// });
//
// var libChartPageHandler = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//   return const LibChartMainPage(
//     title: "chart",
//   );
// });
