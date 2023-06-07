import 'package:osstp_flutter_hive/src/routers/routers_handle.dart';
import 'package:fluro/fluro.dart';

class Routers {
  static const String splashPage = "splash_page"; // 不需要斜线（'/'）  ，防止main tab bar 页面带有返回键
  static const String guidePage = "/guide_page";
  static const String advertisementPage = "/advertisement_page";
  static const String mainTabBar = "/main_tab_bar";

  static const String settingHomePage = "/setting_home_page";
  static const String settingChangeLanguagePage = "/setting_change_language_page";
  static const String settingChangeThemePage = "/setting_change_theme_page";
  static const String settingAuthPage = "/setting_auth_page";
  static const String settingAboutPage = "/setting_about_page";

  static const String loginPage = "/login_page";
  static const String registerPage = "/register_page";

  static String getPageName(String? router) {
    switch (router) {
      case Routers.splashPage:
        return '启动画面';
      case Routers.guidePage:
        return '引导画面';
      case Routers.advertisementPage:
        return '广告';
      case Routers.mainTabBar:
        return '主画面';
      case Routers.settingHomePage:
        return '设置主画面';
      case Routers.settingChangeLanguagePage:
        return '切换语言画面';
      case Routers.settingChangeThemePage:
        return '切换主题画面';
      case Routers.settingAuthPage:
        return '认证画面';
      case Routers.settingAboutPage:
        return '关于画面';
      default:
        return '';
    }
  }
}

class RoutersConfig {
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = routeNotFoundHandle;

    ///
    router.define(Routers.splashPage, handler: splashPageHandler);
    router.define(Routers.guidePage,
        handler: guidePageRouteHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));
    router.define(Routers.mainTabBar,
        handler: mainTabBarRouteHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));

    ///
    router.define(Routers.advertisementPage, handler: advertisementPageRouteHandler, transitionType: TransitionType.inFromRight);
    router.define(Routers.settingHomePage, handler: settingPageHandler, transitionType: TransitionType.inFromRight);
    router.define(Routers.settingChangeLanguagePage,
        handler: settingChangeLanguagePageHandler, transitionType: TransitionType.inFromRight);
    router.define(Routers.settingChangeThemePage,
        handler: settingChangeThemePageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.mineServicePage, handler: mineServicePageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.settingAuthPage, handler: settingAuthPageHandler, transitionType: TransitionType.inFromRight);
    router.define(Routers.settingAboutPage,
        handler: settingAboutPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.loginPage, handler: loginPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.registerPage, handler: registerPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.libChartPage, handler: libChartPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.editPage, handler: editPageRouteHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.editPreviewPage, handler: editPreviewPageRouteHandler, transitionType: TransitionType.inFromRight);
    // router.define(Routers.templateEditPage, handler: templateEditPageRouteHandler, transitionType: TransitionType.inFromRight);
  }
}
