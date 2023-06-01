import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:osstp_flutter_hive/src/routers/routers_config.dart';

class Application {
  static FluroRouter? router;

  /// push
  static Future? push(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) {
    return router?.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }

  /// pop
  static pop<T>(BuildContext context, [T? result]) {
    router?.pop(context, result);
  }

  static popToSplashPage<T>(BuildContext context, [T? result]) {
    router
        ?.navigateTo(context, Routers.splashPage,
            replace: true, transition: TransitionType.fadeIn, rootNavigator: true, clearStack: true)
        .then((result) {});
  }
}
