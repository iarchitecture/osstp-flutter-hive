import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/elevated_button_widget.dart';
import 'package:osstp_flutter_hive/common/widget/getx_dialog_widget.dart';
import 'package:osstp_network/osstp_network.dart';
import '../../../../common/widget/inkWell_button.dart';
import '../../../../common/widget/main_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (getState) {
        osstpLogger.d('message');
      },
      builder: (HomeController controller) {
        return Scaffold(
          appBar: MainAppBar(title: S.current.tabbar_home),
          body: Container(
            child: ElevatedButtonWidget.normal(
              child: Text('-=='),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
