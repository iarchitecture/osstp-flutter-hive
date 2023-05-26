import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_network/osstp_network.dart';
import '../../../../common/widget/main_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final String? title;
  const HomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (getState) {
        osstpLogger.d('message');
      },
      builder: (HomeController controller) {
        return Scaffold(
          appBar: MainAppBar(title: title),
          body: Container(),
        );
      },
    );
  }
}
