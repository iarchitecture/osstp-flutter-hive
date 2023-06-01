import 'package:osstp_flutter_hive/src/routers/routers_handle.dart';
import 'package:fluro/fluro.dart';

class Routers {
  static String splashPage = "splash_page"; // 不需要斜线（'/'）  ，防止main tab bar 页面带有返回键
  static String authPage = "/auth_page";
  static String guidePage = "/guide_page";
  static String mainTabBar = "/main_tab_bar";
  static String cyclePage = "/cycle_page";
  static String favoritePage = "/favorite_page";

  static String editPage = "/edit_page";
  static String editPreviewPage = "/edit_preview_page";
  static String templateEditPage = "/template_edit_page";

  static String settingHomePage = "/setting_home_page";
  static String settingChangeLanguagePage = "/setting_change_language_page";
  static String settingChangeThemePage = "/setting_change_theme_page";
  static String settingAuthPage = "/setting_auth_page";
  static String mineServicePage = "/mine_service_page";
  static String settingAboutPage = "/setting_about_page";
  static String loginPage = "/login_page";
  static String registerPage = "/register_page";
  static String libChartPage = "/chart_page";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = routeNotFoundHandle;

    router.define(splashPage, handler: splashPageHandler);
    // router.define(authPage, handler: authPageHandler);
    router.define(guidePage,
        handler: guidePageRouteHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));
    router.define(mainTabBar,
        handler: mainTabBarRouteHandler,
        transitionType: TransitionType.fadeIn,
        transitionDuration: const Duration(milliseconds: 500));
    // router.define(cyclePage, handler: cyclePageHandler, transitionType: TransitionType.inFromRight);
    // router.define(favoritePage, handler: favoritePageHandler, transitionType: TransitionType.inFromRight);
    router.define(settingHomePage, handler: settingPageHandler, transitionType: TransitionType.inFromRight);
    router.define(settingChangeLanguagePage,
        handler: settingChangeLanguagePageHandler, transitionType: TransitionType.inFromRight);
    router.define(settingChangeThemePage,
        handler: settingChangeThemePageHandler, transitionType: TransitionType.inFromRight);
    // router.define(mineServicePage, handler: mineServicePageHandler, transitionType: TransitionType.inFromRight);
    // router.define(settingAuthPage, handler: settingAuthPageHandler, transitionType: TransitionType.inFromRight);
    router.define(settingAboutPage, handler: settingAboutPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(loginPage, handler: loginPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(registerPage, handler: registerPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(libChartPage, handler: libChartPageHandler, transitionType: TransitionType.inFromRight);
    // router.define(editPage, handler: editPageRouteHandler, transitionType: TransitionType.inFromRight);
    // router.define(editPreviewPage, handler: editPreviewPageRouteHandler, transitionType: TransitionType.inFromRight);
    // router.define(templateEditPage, handler: templateEditPageRouteHandler, transitionType: TransitionType.inFromRight);
  }
}
