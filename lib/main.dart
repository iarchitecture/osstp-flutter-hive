import 'dart:async';
import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:osstp_dynamic_theme/osstp_dynamic_theme.dart';
import 'package:osstp_flutter_hive/src/routers/routers_config.dart';
import 'package:osstp_flutter_hive/src/routers/routers_navigator.dart';
import 'package:osstp_network/osstp_network.dart';
import 'common/config/application_config.dart';
import 'common/global/constant.dart';
import 'generated/l10n.dart';
import 'initial_error_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() async {
    await ApplicationConfig.instance.initConfig();
    OsstpDynamicThemeMode? themeMode = await OsstpDynamicTheme.getThemeMode();
    runApp(MyApp(themeMode: themeMode));

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }, (error, stack) {
    runApp(InitialErrorPage(errorMsg: "ERROR:\n ${error.toString()}\n\n STACK:\n ${stack.toString()}"));
  });
}

class MyApp extends StatefulWidget {
  final OsstpDynamicThemeMode? themeMode;
  const MyApp({Key? key, this.themeMode}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    /// init router
    final router = FluroRouter();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OsstpDynamicThemeWidget(
      initialThemeMode: widget.themeMode ?? OsstpDynamicThemeMode.system,
      light: OsstpDefaultThemeData.lightThemeData,
      dark: OsstpDefaultThemeData.darkThemeData,
      builder: (lightTheme, darkTheme, systemThemeModel) => GetMaterialApp(
        navigatorKey: navigatorKey,
        defaultGlobalState: true,
        enableLog: false,
        logWriterCallback: _localLogWriter,
        title: ApplicationConfig.osstpProjectName,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: systemThemeModel,
        onGenerateRoute: Application.router?.generator,
        initialRoute: Routers.splashPage,
        // navigatorObservers: [MyRouteObserver()],
        locale: Get.deviceLocale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          var result = supportedLocales.where((element) {
            return element.languageCode == locale?.languageCode;
          }).toList();
          if (result.isNotEmpty) {
            return locale;
          }
          return Locale(ApplicationConfig.defaultLanguage);
        },
        localeListResolutionCallback: (locales, Iterable<Locale> supportedLocales) {
          // 监听系统语言切换
          osstpLoggerNoStack.d('locales:$locales');
          // return Locale(ApplicationConfig.defaultLanguage);
        },
      ),
    );
  }

  void _localLogWriter(String text, {bool isError = false}) {
    // pass the message to your favourite logging package here
    // please note that even if enableLog: false log messages will be pushed in this callback
    // you get check the flag if you want through GetConfig.isLogEnable
    if (kDebugMode) {
      print("localLogWriter: $text");
    }
  }
}
