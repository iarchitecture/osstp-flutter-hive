import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../../../common/widget/line_view.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../controller/mine_service_controller.dart';

class MineServicePage extends StatelessWidget {
  const MineServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineServiceController>(
      init: MineServiceController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(title: S.of(context).mine_title),
          body: SafeArea(
            child: Obx(
              () => ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Icon(
                      Icons.hive_rounded,
                      size: 90,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("HIVE"),
                        Text("Version ${controller.version.value}"),
                      ],
                    ),
                  ),
                  AnimationLimiter(
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 77),
                    itemCount: controller.itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: buildItem(context, controller, index),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  buildItem(BuildContext context, MineServiceController controller, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(controller.itemList[index].title ?? ''),
          controller.itemList[index].child ?? Container(),
          LineView(context, margin: const EdgeInsets.only(top: 10))
        ],
      ),
    );
  }
}
