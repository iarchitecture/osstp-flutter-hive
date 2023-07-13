import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:osstp_flutter_hive/common/widget/inkWell_button.dart';

import '../../../../common/widget/line_view.dart';
import '../../../../common/widget/main_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../controller/mine_profile_controller.dart';

class MineProfilePage extends StatelessWidget {
  const MineProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineProfileController>(
      init: MineProfileController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(title: S.of(context).mine_profile_edit),
          body: SafeArea(
            child: ListView(
              children: [
                InkWellButton.normal(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: controller.imageFileList.isEmpty
                            ? Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: const Icon(Icons.photo_library),
                              )
                            : Container(
                                color: Colors.grey,
                                height: 80,
                                alignment: Alignment.center,
                                child: Image.file(
                                  File(controller.imageFileList[0].path),
                                  height: 80,
                                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) =>
                                      const Center(
                                          child: SizedBox(
                                              height: 80,
                                              child: Text(
                                                'This image type is not supported',
                                                textAlign: TextAlign.center,
                                              ))),
                                ),
                              ),
                      ),
                    ],
                  ),
                  onTap: () async {
                    try {
                      final XFile? pickedFile = await controller.picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      controller.setImageFileListFromFile(pickedFile);
                    } catch (e) {
                      controller.setPickImageError(e);
                    }
                  },
                ),
                AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 10, bottom: 77),
                    itemCount: 5,
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
                  ),
                ),
                controller.pickImageError != null
                    ? Text(
                        'Pick image error: ${controller.pickImageError}',
                        textAlign: TextAlign.center,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  buildItem(BuildContext context, MineProfileController controller, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('-=-='), LineView(context, margin: const EdgeInsets.only(top: 10))],
      ),
    );
  }
}
