import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:osstp_dynamic_theme/osstp_dynamic_theme.dart';
import 'package:osstp_flutter_hive/src/main_tabbar/page/main_tabbar_page.dart';
import 'package:osstp_flutter_hive/src/modules/others/splash/page/splash_page.dart';
import 'common/config/application_config.dart';
import 'common/global/constant.dart';
import 'common/global/routes.dart';
import 'generated/l10n.dart';
import 'initial_error_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await ApplicationConfig.instance.initConfig();
    OsstpDynamicThemeMode? themeMode = await OsstpDynamicTheme.getThemeMode();
    runApp(MyApp(themeMode: themeMode));
  } on Error catch (e) {
    runApp(InitialErrorPage(errorMsg: " ${e.runtimeType.toString()} \n ${e.toString()}\n ${e.stackTrace.toString()}"));
  }

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  final OsstpDynamicThemeMode? themeMode;
  const MyApp({Key? key, this.themeMode}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OsstpDynamicThemeWidget(
      initialThemeMode: widget.themeMode ?? OsstpDynamicThemeMode.system,
      light: OsstpDefaultThemeData.lightThemeData,
      dark: OsstpDefaultThemeData.darkThemeData,
      builder: (lightTheme, darkTheme, systemThemeModel) => GetMaterialApp(
        //全局导航状态Key,
        navigatorKey: navigatorKey,
        defaultGlobalState: true,
        enableLog: false,
        logWriterCallback: localLogWriter,
        title: ApplicationConfig.osstpProjectName,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: systemThemeModel,
        // onGenerateRoute: Application.router?.generator, //路由改变响应方法,
        initialRoute: Routes.guidePage, //初始化路由路径,
        // navigatorObservers: [MyRouteObserver()], //路由改变监听,
        locale: Get.deviceLocale, //要读取系统区域设置，您可以使用
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // 设置多语言回调
          var result = supportedLocales.where((element) {
            return element.languageCode == locale?.languageCode;
          }).toList();
          if (result.isNotEmpty) {
            return locale;
          }
          // 设置默认使用语言
          return Locale(ApplicationConfig.defaultLanguage);
        },
        localeListResolutionCallback: (locales, Iterable<Locale> supportedLocales) {
          // 失败或者未提供语言环境
          return Locale(ApplicationConfig.defaultLanguage);
        },

        home: const SplashPage(),
      ),
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    // pass the message to your favourite logging package here
    // please note that even if enableLog: false log messages will be pushed in this callback
    // you get check the flag if you want through GetConfig.isLogEnable
  }
}
