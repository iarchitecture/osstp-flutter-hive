import 'dart:async';
import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:osstp_dynamic_theme/osstp_dynamic_theme.dart';
import 'package:osstp_flutter_hive/src/routers/route_observer.dart';
import 'package:osstp_flutter_hive/src/routers/routers_config.dart';
import 'package:osstp_flutter_hive/src/routers/routers_navigator.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'common/config/application_config.dart';
import 'common/global/constant.dart';
import 'common/utils/logger.dart';
import 'generated/l10n.dart';
import 'initial_error_page.dart';
import 'main.mapper.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeJsonMapper();
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
    RoutersConfig.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OsstpDynamicThemeWidget(
      initialThemeMode: widget.themeMode ?? OsstpDynamicThemeMode.system,
      light: OsstpDefaultThemeData.lightThemeData,
      dark: OsstpDefaultThemeData.darkThemeData,
      builder: (lightTheme, darkTheme, systemThemeModel) => RefreshConfiguration(
        headerBuilder: () =>
            const WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder: () => const ClassicFooter(), // Configure default bottom indicator
        headerTriggerDistance: 80.0, // header trigger refresh trigger distance
        springDescription: const SpringDescription(
            stiffness: 170, damping: 16, mass: 1.9), // custom spring back animate,the props meaning see the flutter api
        maxOverScrollExtent:
            100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
        enableScrollWhenRefreshCompleted:
            true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        enableLoadingWhenFailed:
            true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
        hideFooterWhenNotFull:
            false, // Disable pull-up to load more functionality when Viewport is less than one screen
        enableBallisticLoad: true,
        child: GetMaterialApp(
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
          navigatorObservers: [GlobalRouteObserver()],
          locale: Get.deviceLocale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
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
            osstpLoggerNoStack.d('locales:$locales');
            // return Locale(ApplicationConfig.defaultLanguage);
          },
          builder: EasyLoading.init(),
        ),
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
