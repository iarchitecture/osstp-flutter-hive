import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/global/constant.dart';
import 'package:osstp_flutter_hive/src/modules/others/guide/page/guide_page.dart';
import 'package:osstp_local_storage/osstp_local_storage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../../common/config/application_config.dart';
import '../../../../../common/global/preferences_key.dart';
import '../../../../../common/global/routes.dart';
import '../../../../../common/utils/string_utils.dart';
import '../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Material(
          child: Scaffold(
            // backgroundColor: const Color(0xffF67900),
            body: Stack(
              children: <Widget>[
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.hive_rounded,
                      color: Colors.white,
                      size: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 117.0),
                      child: linerIndicator(voidCallback: () {
                        newPage();
                      }),
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
      animationDuration: 3500,
      percent: 1.0,
      barRadius: const Radius.circular(5),
      progressColor: Colors.cyan,
      alignment: MainAxisAlignment.center,
      onAnimationEnd: () {
        if (voidCallback != null) {
          voidCallback();
        }
      },
    );
  }

  Future<void> newPage() async {
    String routing = "";
    bool? hasDisplay = await OsstpLocalStorage.fromPrefs(LocalStoreKey.guideHasDisplay, isBoolValue: true);
    if (!itIsEmpty(hasDisplay) && hasDisplay == true) {
      routing = Routes.mainTabBar;
    } else {
      routing = Routes.guidePage;
    }
    // Get.to(const GuidePage());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
