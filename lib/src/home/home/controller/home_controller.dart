import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../api/home_api.dart';

class HomeController extends SuperController {
  final List<Widget> imagesData = [
    const Icon(
      Icons.flutter_dash_rounded,
      color: Color(0xffF67904),
      size: 160,
    ),
    const Icon(
      Icons.safety_check_rounded,
      color: Color(0xffD12D2E),
      size: 160,
    ),
    const Icon(
      Icons.view_module_rounded,
      color: Color(0xff7A1EA1),
      size: 160,
    ),
    const Icon(
      Icons.free_breakfast_rounded,
      color: Color(0xff1773CF),
      size: 160,
    ),
  ];

  final List<Color> backgroundColors = [
    const Color(0xffF67904),
    const Color(0xffD12D2E),
    const Color(0xff7A1EA1),
    const Color(0xff1773CF)
  ];


  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 2000));

  }

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }
}
