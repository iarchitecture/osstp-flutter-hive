import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../controller/setting_auth_controller.dart';

/// auth
class SettingAuthPage extends StatelessWidget {
  const SettingAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingAuthController>(
      init: SettingAuthController(),
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(title: S.of(context).setting_auth),
          body: Obx(() => ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  const Text("是否支持生物识别功能："),
                  if (controller.supportState.value == SupportState.unknown)
                    const CircularProgressIndicator()
                  else if (controller.supportState.value == SupportState.supported)
                    const Text('This device is supported')
                  else
                    const Text('This device is not supported'),
                  const Divider(height: 50),
                  Text('Can check biometrics: ${controller.canCheckBiometrics.value}\n'),
                  ElevatedButton(
                    onPressed: () {
                      controller.checkBiometrics();
                    },
                    child: const Text('Check biometrics'),
                  ),
                  const Divider(height: 50),
                  Text('Available biometrics: ${controller.availableBiometrics.value}\n'),
                  ElevatedButton(
                    onPressed: () {
                      controller.getAvailableBiometrics();
                    },
                    child: const Text('Get available biometrics'),
                  ),
                  const Divider(height: 50),
                  Text('Current State: ${controller.authorized.value}\n'),
                  if (controller.isAuthenticating.value == true)
                    ElevatedButton(
                      onPressed: () {
                        controller.cancelAuthentication();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text('Cancel Authentication'),
                          Icon(Icons.cancel),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            controller.authenticate(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Text('Authenticate'),
                              Icon(Icons.perm_device_information),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.authenticateWithBiometrics();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(controller.isAuthenticating.value == true
                                  ? 'Cancel'
                                  : 'Authenticate: biometrics only'),
                              const Icon(Icons.security_rounded),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              )),
        );
      },
    );
  }
}
