import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/global/preferences_key.dart';
import 'package:osstp_local_storage/osstp_local_storage.dart';

import '../../../../../common/library/lib_flutter_page_indicator/flutter_page_indicator.dart';
import '../../../../../common/library/lib_transformer_page_view/parallax.dart';
import '../../../../../common/library/lib_transformer_page_view/transformer_page_view.dart';
import '../controller/guide_controller.dart';


class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  TransformerPageController? pageController;

  PageIndicatorLayout layout = PageIndicatorLayout.WARM;
  double size = 8.0;
  double activeSize = 10.0;
  @override
  void initState() {
    pageController = TransformerPageController(itemCount: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuideController>(
        init: GuideController(),
        builder: (controller) {
          return Material(
            child: Scaffold(
              body: Stack(
                children: <Widget>[
                  TransformerPageView(
                    pageController: pageController,
                    loop: false,
                    transformer: PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
                      return ParallaxColor(
                        colors: controller.backgroundColors,
                        info: info,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: ParallaxContainer(
                              position: info.position,
                              opacityFactor: 1.0,
                              translationFactor: 400.0,
                              // child: Image.asset(controller.images[info.index]),
                              child: controller.imagesData[info.index],
                            )),
                            ParallaxContainer(
                              position: info.position,
                              translationFactor: 100.0,
                              child: Text(
                                controller.titles[info.index],
                                style: const TextStyle(fontSize: 30.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ParallaxContainer(
                              position: info.position,
                              translationFactor: 100.0,
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 50.0),
                                  child: Text(controller.subtitles[info.index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 13.0, color: Colors.white))),
                            ),
                          ],
                        ),
                      );
                    }),
                    itemCount: controller.imagesData.length,
                    onPageChanged: (index) {
                      controller.index.value = index;
                      if (index == controller.imagesData.length - 1) {
                        // 滚动到最后一个画面在记录
                        OsstpLocalStorage.savePrefs(LocalStoreKey.guideHasDisplay, boolValue: true);
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: PageIndicator(
                        layout: layout,
                        size: size,
                        activeSize: activeSize,
                        controller: pageController!,
                        space: 5.0,
                        count: 4,
                      ),
                    ),
                  ),
                  Obx(
                    () => Offstage(
                      offstage: controller.index.value == controller.imagesData.length - 1 ? false : true,
                      child: Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                        child: TextButton(
                          onPressed: () {
                            newHomePage();
                          },
                          child: const Text(
                            "跳过",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void newHomePage() {
    // Application.router
    //     ?.navigateTo(context, Routes.mainTabBar, replace: true, transitionDuration: const Duration(seconds: 1))
    //     .then((result) {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
