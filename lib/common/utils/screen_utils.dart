import 'dart:ui';


double osstpScreenWidth() {
  return PlatformDispatcher.instance.implicitView!.physicalSize.width / window.devicePixelRatio;
}

double osstpScreenHeight() {
  return window.physicalSize.height / window.devicePixelRatio;
}

double osstpFitWidth(double width) {
  return osstpScreenWidth() / 375.0 * width;
}

double osstpFitHeight(double height) {
  return osstpScreenHeight() / 667.0 * height;
}
