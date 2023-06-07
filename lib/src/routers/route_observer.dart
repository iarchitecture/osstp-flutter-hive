import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:osstp_flutter_hive/src/routers/routers_config.dart';

///
class GlobalRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (kDebugMode) {
      print('didPush route: ${Routers.getPageName(route.settings.name)}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (kDebugMode) {
      print('didPop route: ${Routers.getPageName(previousRoute?.settings.name)}');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (kDebugMode) {
      print('didReplace newRoute: ${Routers.getPageName(newRoute?.settings.name)}');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    if (kDebugMode) {
      print('didRemove route: $route,previousRoute:$previousRoute');
    }
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    if (kDebugMode) {
      print('didStartUserGesture route: $route,previousRoute:$previousRoute');
    }
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    if (kDebugMode) {
      print('didStopUserGesture');
    }
  }
}
