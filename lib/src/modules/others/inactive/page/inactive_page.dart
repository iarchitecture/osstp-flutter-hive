import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/global/constant.dart';
import 'package:osstp_flutter_hive/common/theme/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../../common/config/application_config.dart';
import '../controller/inactive_controller.dart';

class InactivePage extends StatefulWidget {
  const InactivePage({Key? key}) : super(key: key);

  @override
  State<InactivePage> createState() => _InactivePageState();
}

class _InactivePageState extends State<InactivePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InactiveController>(
      init: InactiveController(),
      builder: (controller) {
        return Material(
          child: Scaffold(
            backgroundColor: ThemeColors.primaryBackgroundThemeColor(context),
            body: Stack(
              children: <Widget>[
                Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.hive_rounded,
                          color: Colors.white,
                          size: 120,
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ApplicationConfig.osstpBundleName,
                          style: const TextStyle(
                              color: Color(0xFF00D6F7),
                              fontFamily: ConstantFonts.STLITI,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.android_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          Icon(
                            Icons.apple_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  linerIndicator({VoidCallback? voidCallback}) {
    return LinearPercentIndicator(
      width: 160,
      animation: true,
      lineHeight: 10.0,
      animationDuration: 1500,
      percent: 1.0,
      barRadius: const Radius.circular(5),
      progressColor: Colors.transparent,
      alignment: MainAxisAlignment.center,
      onAnimationEnd: () {
        if (voidCallback != null) {
          voidCallback();
        }
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
