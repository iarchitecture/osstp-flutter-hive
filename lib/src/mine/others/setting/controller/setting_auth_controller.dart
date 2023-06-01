import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:osstp_network/osstp_network.dart';

import '../../../../routers/routers_config.dart';
import '../../../../routers/routers_navigator.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class SettingAuthController extends SuperController {
  final auth = LocalAuthentication();
  final supportState = SupportState.unknown.obs;
  final canCheckBiometrics = false.obs;
  //List<BiometricType>?
  final availableBiometrics = [].obs;
  final isAuthenticating = false.obs;
  final authorized = 'Not Authorized'.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 0)).then((onValue) {
      initPlatformState();
    });
  }

  /// 初始化
  Future<void> initPlatformState() async {
    // 获取认证支持状态
    auth.isDeviceSupported().then((bool isSupported) {
      supportState.value = isSupported ? SupportState.supported : SupportState.unsupported;
      //

      if (supportState.value == SupportState.supported) {
        checkBiometrics();
      }
    });
  }

  Future<void> checkBiometrics() async {
    late bool biometrics;
    try {
      biometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      biometrics = false;
      osstpLoggerNoStack.d(e);

      return;
    }

    canCheckBiometrics.value = biometrics;

    if (canCheckBiometrics.value == true) {
      getAvailableBiometrics();
    }
  }

  /// Possible values include:
  /// - BiometricType.face
  /// - BiometricType.fingerprint
  /// - BiometricType.iris (not yet implemented)
  /// - BiometricType.strong
  /// - BiometricType.weak
  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> biometrics;
    try {
      biometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      biometrics = <BiometricType>[];
      osstpLoggerNoStack.d(e);

      return;
    }
    osstpLoggerNoStack.d(biometrics);
    availableBiometrics.value = biometrics;
  }

  /// 认证
  Future<void> authenticate(BuildContext context) async {
    bool authenticated = false;
    try {
      isAuthenticating.value = true;
      authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      authedFinish(context, authenticated);
      isAuthenticating.value = false;
    } on PlatformException catch (e) {
      isAuthenticating.value = false;
      authorized.value = 'Error - ${e.message}';

      return;
    }
    // if (!mounted) {
    //   return;
    // }

    authorized.value = authenticated ? 'Authorized' : 'Not Authorized';
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      isAuthenticating.value = true;
      authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      isAuthenticating.value = false;
      authorized.value = 'Authenticating';
    } on PlatformException catch (e) {
      isAuthenticating.value = false;
      authorized.value = 'Error - ${e.message}';

      return;
    }
    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    authorized.value = message;
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    isAuthenticating.value = false;
  }

  authedFinish(BuildContext context, bool authenticated) {
    // 实现跳转
    if (authenticated) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        if (Navigator.of(context).canPop()) {
          // osstpLoggerNoStack.d("===> canPop");
          Application.pop(context);
        } else {
          Application.push(context, Routers.mainTabBar,
                  replace: true, transitionDuration: const Duration(seconds: 1))
              ?.then((value) {});
        }
      });
    }
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
